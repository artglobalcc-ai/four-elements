extends Node

# Characters in party order.
# Assign these in the Inspector.
@export var party: Array[CharacterBody2D] = []

@export var follow_spacing: float = 32.0
@export var record_step: float = 1.0
@export var camera: Camera2D

var leader_index: int = 0

# The recorded route, from oldest to newest.
var route: Array[Vector2] = []
var route_distances: Array[float] = []

# Distance traveled along the route.
var total_distance: float = 0.0

# Distance offset for the initial party formation.
var starting_offsets: Array[Vector2] = []

# Added: jumps are remembered as distances along the recorded route.
var jump_events: Array[Dictionary] = []
var next_jump_id: int = 0
var follower_last_jump: Dictionary = {}


func _ready() -> void:
	if party.is_empty():
		push_warning("PartyController: No characters assigned.")
		return

	# Only the first character receives keyboard input.
	for i in range(party.size()):
		party[i].set_player_controlled(i == 0)
		# Listen for a jump only while this character is the leader.
		party[i].connect("jump_started", Callable(self, "_on_character_jump_started").bind(party[i]))
		follower_last_jump[party[i].get_instance_id()] = 0

	# Record the starting leader position.
	var leader: CharacterBody2D = party[0]
	route.append(leader.global_position)
	route_distances.append(0.0)

	# Create a starting path through the party's
	# current positions, from last follower to leader.
	initialize_party_route()

	update_camera()


func _physics_process(delta: float) -> void:
	if party.is_empty():
		return

	if Input.is_action_just_pressed("switch_character"):
		rotate_party()

	record_leader()

	update_followers(delta)

	update_camera()


func initialize_party_route() -> void:
	route.clear()
	route_distances.clear()
	total_distance = 0.0

	# Build the initial route from the last
	# follower through to the leader.
	for i in range(party.size() - 1, -1, -1):
		var position: Vector2 = party[i].global_position

		if route.is_empty():
			route.append(position)
			route_distances.append(0.0)
		else:
			total_distance += route[-1].distance_to(position)
			route.append(position)
			route_distances.append(total_distance)


func record_leader() -> void:
	var leader: CharacterBody2D = party[0]
	var position: Vector2 = leader.global_position

	if route.is_empty():
		route.append(position)
		route_distances.append(0.0)
		return

	var distance: float = route[-1].distance_to(position)

	if distance < record_step:
		return

	total_distance += distance

	route.append(position)
	route_distances.append(total_distance)


# Added: capture the precise route distance at the jump's start.
func _on_character_jump_started(direction: Vector2, character: CharacterBody2D) -> void:
	if party.is_empty() or character != party[0]:
		return

	# Force a route point even if the leader moved less than record_step.
	var position: Vector2 = character.global_position
	if route.is_empty():
		route.append(position)
		route_distances.append(total_distance)
	else:
		var distance: float = route[-1].distance_to(position)
		if distance > 0.001:
			total_distance += distance
			route.append(position)
			route_distances.append(total_distance)

	next_jump_id += 1
	jump_events.append({
		"id": next_jump_id,
		"distance": total_distance,
		"direction": direction
	})


func update_followers(delta: float) -> void:
	if route.size() < 2:
		return

	for i in range(1, party.size()):
		var follower: CharacterBody2D = party[i]

		var target_distance: float = maxf(
			0.0,
			total_distance - follow_spacing * i
		)

		var target_position: Vector2 = position_on_route(
			target_distance
		)

		var previous_position: Vector2 = follower.global_position

		follower.global_position = target_position

		var movement: Vector2 = (
			target_position - previous_position
		)

		# Added: trigger jumps when this follower reaches their route location.
		var character_id: int = follower.get_instance_id()
		var last_jump_id: int = int(follower_last_jump.get(character_id, 0))
		for event in jump_events:
			var event_id: int = int(event["id"])
			if event_id <= last_jump_id:
				continue
			if target_distance + 0.001 < float(event["distance"]):
				break
			follower_last_jump[character_id] = event_id
			last_jump_id = event_id
			if not follower.is_jumping:
				follower.start_jump(event["direction"])
			break

		# Added: animate the follower without applying extra physics movement.
		if follower.is_jumping:
			follower.update_jump(delta, false)

		if movement.length_squared() > 0.001:
			var facing: String = follower.get_direction_name(
				movement
			)
			follower.set_facing(facing, true)
		else:
			follower.set_facing(
				follower.facing_direction,
				false
			)


func position_on_route(distance: float) -> Vector2:
	if route.is_empty():
		return Vector2.ZERO

	if distance <= route_distances[0]:
		return route[0]

	for i in range(1, route.size()):
		if route_distances[i] >= distance:
			var start: float = route_distances[i - 1]
			var finish: float = route_distances[i]

			var length: float = finish - start

			if length <= 0.0:
				return route[i]

			var fraction: float = (
				distance - start
			) / length

			return route[i - 1].lerp(
				route[i],
				clampf(fraction, 0.0, 1.0)
			)

	return route[-1]


func rotate_party() -> void:
	if party.size() < 2:
		return

	# Save the physical slots occupied by each character.
	var positions: Array[Vector2] = []
	var facings: Array[String] = []

	for character in party:
		positions.append(character.global_position)
		facings.append(character.facing_direction)

	# Added: end active jumps and discard jumps from the previous party order.
	for character in party:
		if character.is_jumping:
			character.finish_jump()
	jump_events.clear()
	for character in party:
		follower_last_jump[character.get_instance_id()] = next_jump_id

	# Rotate identities:
	# [Aang, Sokka, Katara]
	# becomes [Sokka, Katara, Aang].
	var previous_leader: CharacterBody2D = party.pop_front()
	party.append(previous_leader)

	# Move each character into its new slot.
	for i in range(party.size()):
		party[i].global_position = positions[i]
		party[i].velocity = Vector2.ZERO
		party[i].set_facing(facings[i], false)
		party[i].set_player_controlled(i == 0)

	update_camera()

	print("Now controlling: ", party[0].name)


func update_camera() -> void:
	if camera == null or party.is_empty():
		return

	camera.global_position = party[0].global_position
