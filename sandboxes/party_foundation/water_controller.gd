extends Node2D

const DEFINITION = preload("res://sandboxes/party_foundation/water_manipulation.tres")
var owner_actor: Node
var world: Node
var definition: Resource = DEFINITION
var selected: bool = true
var shot: Node
var carrying: bool = false
var water_position: Vector2 = Vector2.ZERO
var release_target: Node2D
var releasing: bool = false
var release_position: Vector2
var inactive_offset := Vector2(20, -12)
var was_controlled: bool = false
var animation_time: float = 0.0
var splashes: Array = []
var aim_override: Variant = null # Used by deterministic engine tests only.
var path_goal := Vector2(INF, INF)
var path: PackedVector2Array = PackedVector2Array()
var path_age: float = 0.0

func _ready() -> void:
	z_index = 4
	owner_actor.formation_slot_changed.connect(_on_formation_slot_changed)

func _on_formation_slot_changed(displacement: Vector2) -> void:
	if carrying:
		# Tab intentionally swaps physical slots. Keep the owned effect with its character.
		water_position += displacement
		path.clear()
		path_goal = Vector2(INF, INF)

func payload() -> Dictionary:
	return {"technique_id": definition.technique_id, "source": owner_actor.character_id,
		"utilities": definition.utilities, "properties": definition.material_properties,
		"strength": definition.strength, "amount": 1.0}

func select_technique(actor: Node) -> bool:
	if actor != owner_actor or not definition.allowed_characters.has(actor.character_id):
		world.manager.message = "Water Manipulation is available to Katara in this sandbox."
		return false
	selected = true
	world.manager.message = "Water selected: collect, place in a vessel, extinguish fire, or click to shoot."
	queue_redraw()
	return true

func target_at(point: Vector2) -> Node2D:
	var closest: Node2D
	var distance: float = INF
	for target in get_tree().get_nodes_in_group("sandbox_environment_targets"):
		var candidate: float = point.distance_to(target.global_position)
		if candidate <= target.radius + 5 and candidate < distance:
			closest = target
			distance = candidate
	return closest

func click_at(actor: Node, point: Vector2) -> bool:
	if actor != owner_actor or not selected or (shot != null and shot.casting):
		return false
	if get_tree().paused:
		return false
	var target: Node2D = target_at(point)
	if carrying:
		if releasing:
			world.manager.message = "Water is already being released."
			return true
		if target == null:
			return shoot_at(actor,point)
		if not target.can_receive(payload()):
			# Placement/source interaction takes precedence over shooting at containers.
			if target.kind in ["reservoir","vessel","source","fire","ice_crossing"]:
				world.manager.message = "That object cannot accept held water right now."
				return true
			return shoot_at(actor,point)
		if not within_range(target.global_position) or not has_water_route(water_position, target.global_position):
			world.manager.message = "Target is out of range or the water route is blocked. Move Katara closer."
			return true
		release_target = target
		release_position = target.global_position
		releasing = true
		path.clear()
		path_goal = Vector2(INF, INF)
		world.manager.message = "Releasing water..."
		return true
	if target == null or not target.is_available_source():
		world.manager.message = "Choose accessible liquid water; frozen water must be thawed first."
		return true
	var pickup_point: Vector2 = target.water_pickup_point(owner_actor.global_position) if target.has_method("water_pickup_point") else target.global_position
	if not within_range(pickup_point) or not has_water_route(owner_actor.global_position, pickup_point):
		world.manager.message = "Water source is too far away or blocked. Move closer."
		return true
	if not target.take_water():
		world.manager.message = "That container is empty."
		return true
	carrying = true
	water_position = pickup_point
	inactive_offset = Vector2(20, -12)
	owner_actor.concentration_remaining = definition.concentration_seconds
	was_controlled = owner_actor.player_controlled
	path.clear()
	path_goal = Vector2(INF, INF)
	world.manager.message = "Water collected: 45s concentration. Walk and aim; Tab/R preserve Katara's water."
	return true

func shoot_at(actor: Node, point: Vector2) -> bool:
	if shot == null:
		return false
	shot.selected = true
	return shot.click_at(actor,point)

func within_range(point: Vector2) -> bool:
	return owner_actor.global_position.distance_to(point) <= definition.control_range + 0.01

func has_water_route(from: Vector2, to: Vector2) -> bool:
	return not route_for(from, to).is_empty()

func route_for(from: Vector2, to: Vector2) -> PackedVector2Array:
	var route: PackedVector2Array = world.find_route(from, to)
	# The exact destination can be in range while its navigation cell's center is outside.
	# Swept wall checks below still validate the final partial-cell segment.
	if route.size() >= 2 and not within_range(route[-2]) and within_range(to):
		route.remove_at(route.size()-2)
	if route.size() >= 2 and not within_range(route[0]) and within_range(from):
		route.remove_at(0)
	for point in route:
		if not within_range(point):
			return PackedVector2Array()
	return route

func cancel(reason: String = "Water released onto the ground.") -> void:
	if shot != null and reason != "Water launched.":
		shot.cancel()
	if not carrying:
		return
	splash(water_position)
	carrying = false
	releasing = false
	release_target = null
	owner_actor.concentration_remaining = 0.0
	path.clear()
	world.manager.message = reason
	queue_redraw()

func splash(point: Vector2) -> void:
	splashes.append({"position": point, "age": 0.0})
	while splashes.size() > 8:
		splashes.pop_front()

func _physics_process(delta: float) -> void:
	animation_time += delta
	for effect in splashes:
		effect.age += delta
	while not splashes.is_empty() and splashes[0].age > 0.65:
		splashes.pop_front()
	if not carrying:
		queue_redraw()
		return
	if owner_actor.concentration_remaining <= 0:
		cancel("Katara's concentration expired; the water fell.")
		return
	var controlled: bool = owner_actor.player_controlled
	if was_controlled and not controlled:
		inactive_offset = (water_position - owner_actor.global_position).limit_length(28.0)
	was_controlled = controlled
	var aim: Vector2 = aim_override if aim_override is Vector2 else get_global_mouse_position()
	var desired: Vector2 = owner_actor.global_position + (aim - owner_actor.global_position).limit_length(definition.control_range)
	if not controlled:
		desired = owner_actor.global_position + inactive_offset
	if releasing:
		if not is_instance_valid(release_target) or not within_range(release_position):
			releasing = false
			release_target = null
			world.manager.message = "Release interrupted: target moved out of Katara's range. Water retained."
		else:
			desired = release_position
	move_water(desired, delta)
	if carrying and releasing and water_position.distance_to(release_position) <= 2.0:
		var applied: bool = release_target.receive_interaction(payload())
		if applied:
			var result_kind: String = release_target.kind
			var feedback: String = "Fire extinguished."
			if result_kind == "reservoir":
				feedback = "Reservoir filled: gate opened. Click it again to draw the stored water."
			elif result_kind == "vessel":
				feedback = "Vessel filled. Click it again to draw its stored water."
			cancel(feedback)
		else:
			releasing = false
			release_target = null
			world.manager.message = "Target no longer accepts water; water retained."
	queue_redraw()

func move_water(desired: Vector2, delta: float) -> void:
	# The control circle travels with Katara. Walking away from water at the edge
	# pulls it inward; reaching that edge alone must never cancel concentration.
	if not within_range(water_position):
		var boundary: Vector2 = owner_actor.global_position + (water_position-owner_actor.global_position).limit_length(definition.control_range)
		var correction := PhysicsRayQueryParameters2D.create(water_position, boundary, 1)
		if get_world_2d().direct_space_state.intersect_ray(correction).is_empty():
			water_position = boundary
		else:
			# Keep a wall-blocked element in place rather than teleporting it through solids.
			path.clear()
			return
	# Clear-space steering follows the live cursor EVERY physics frame, with easing.
	# Cached grid goals are only for navigating around obstacles, never ordinary aiming.
	var direct_motion := PhysicsRayQueryParameters2D.create(water_position,desired,1)
	if get_world_2d().direct_space_state.intersect_ray(direct_motion).is_empty():
		var offset: Vector2 = desired - water_position
		var motion: Vector2 = (offset * (1.0-exp(-12.0*delta))).limit_length(definition.control_speed*delta)
		water_position += motion
		path.clear()
		return
	path_age += delta
	if desired.distance_to(path_goal) > 8.0 or path_age > 0.2:
		path_goal = desired
		path_age = 0.0
		var direct := PhysicsRayQueryParameters2D.create(water_position, desired, 1)
		if get_world_2d().direct_space_state.intersect_ray(direct).is_empty():
			path = PackedVector2Array([desired])
		else:
			path = route_for(water_position, desired)
	var budget: float = definition.control_speed * delta
	while not path.is_empty() and budget > 0.001:
		var destination: Vector2 = path[0]
		var distance: float = water_position.distance_to(destination)
		var step: float = minf(budget, distance)
		var next: Vector2 = water_position.move_toward(destination, step)
		var ray := PhysicsRayQueryParameters2D.create(water_position, next, 1)
		if not get_world_2d().direct_space_state.intersect_ray(ray).is_empty():
			path.clear()
			break
		water_position = next
		budget -= step
		if distance <= step + 0.001:
			path.remove_at(0)

func _draw() -> void:
	if selected and owner_actor != null and owner_actor.player_controlled:
		draw_arc(owner_actor.global_position, definition.control_range, 0, TAU, 64, Color(0.15, 0.55, 0.9, 0.12))
	if carrying:
		var bob := Vector2(0, sin(animation_time * 5) * 1.5 - 7)
		var display: Vector2 = water_position + bob
		draw_circle(water_position, 6, Color(0.08, 0.25, 0.5, 0.15))
		draw_circle(display, 6 + sin(animation_time * 6) * 0.5, Color("238bd3"))
		draw_circle(display + Vector2(-2, -2), 2, Color("a2eeff"))
		draw_arc(display, 8, animation_time * 2, animation_time * 2 + PI * 1.3, 18, Color("5bcfff"), 1)
		for i in range(3):
			var angle: float = animation_time * 3 + i * TAU / 3
			draw_circle(display + Vector2(cos(angle) * 9, sin(angle) * 5), 1.2, Color("5bcfff"))
	for effect in splashes:
		var progress: float = effect.age / 0.65
		draw_arc(effect.position, 3 + progress * 13, 0, TAU, 24, Color(0.1, 0.55, 1, 1-progress), 1.5)
		for i in range(5):
			var direction := Vector2.from_angle(i * TAU / 5)
			draw_circle(effect.position + direction * progress * 14 + Vector2(0,-sin(progress * PI)*5), 1.5, Color(0.25,0.7,1,1-progress))
