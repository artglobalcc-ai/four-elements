extends Node

const Group = preload("res://sandboxes/party_foundation/travel_group.gd")
var groups: Array = []
var active_index: int = 0
var roster: Array = []
var navigation: Node
var camera: Camera2D
var returning: Dictionary = {}
var message: String = "Explore, split the team, then try regrouping through the ice gate."

func active_group():
	return groups[active_index]

func configure(actors: Array, world: Node, view_camera: Camera2D) -> void:
	roster = actors.duplicate()
	navigation = world
	camera = view_camera
	var group = Group.new()
	group.members = actors.duplicate()
	group.reset_route()
	groups.append(group)
	for actor in actors:
		actor.jump_started.connect(_on_jump.bind(actor))
		actor.jump_finished.connect(_on_jump_finished.bind(actor))
	refresh_control()

func _on_jump(direction: Vector2, actor: Node) -> void:
	for group in groups:
		if group.members[0] == actor:
			group.remember_jump(direction)
			break

func _on_jump_finished(trace: Array, actor: Node) -> void:
	for group in groups:
		if group.members[0]==actor:
			group.finish_jump(trace)
			break

func refresh_control() -> void:
	for actor in roster:
		actor.set_player_controlled(actor == active_group().members[0])
	for i in range(groups.size()):
		for actor in groups[i].members:
			actor.group_number = i + 1
	camera.global_position = active_group().members[0].global_position

func group_is_jumping() -> bool:
	return active_group().members.any(func(actor): return actor.is_jumping)

func rotate_leader() -> void:
	if group_is_jumping():
		message = "Finish the group's jumps before changing the leader."
		return
	var group = active_group()
	if group.members.size() < 2:
		return
	var positions: Array = []
	var facings: Array = []
	var heights: Array = []
	var cursor_slots: Array = []
	for actor in group.members:
		positions.append(actor.global_position)
		facings.append(actor.facing_direction)
		heights.append(actor.ground_height)
		cursor_slots.append(group.cursors.get(actor.character_id, group.travelled))
		if actor.is_jumping:
			actor.finish_jump()
	group.members.append(group.members.pop_front())
	group.jump_events.clear()
	for i in range(group.members.size()):
		var actor = group.members[i]
		var previous_position: Vector2 = actor.global_position
		actor.global_position = positions[i]
		actor.set_ground_height(heights[i])
		actor.formation_slot_changed.emit(actor.global_position - previous_position)
		actor.set_facing(facings[i], false)
		group.cursors[actor.character_id] = cursor_slots[i]
		group.last_jumps[actor.character_id] = group.jump_serial
	refresh_control()

func select_next_group() -> void:
	if group_is_jumping():
		message = "Finish jumping before switching groups."
		return
	cancel_regroup()
	active_index = (active_index + 1) % groups.size()
	refresh_control()

func split_selected(selected_ids: Array) -> bool:
	if group_is_jumping():
		message = "Land before splitting the group."
		return false
	if groups.size() >= 4:
		message = "Four groups maximum. Rejoin a group before splitting again."
		return false
	var group = active_group()
	if not selected_ids.has(group.members[0].character_id):
		message = "Keep the current leader in the selected group."
		return false
	var keep: Array = []
	var leave: Array = []
	for actor in group.members:
		if selected_ids.has(actor.character_id):
			keep.append(actor)
		else:
			leave.append(actor)
	if keep.is_empty() or leave.is_empty():
		message = "Choose at least one companion to leave behind."
		return false
	cancel_regroup()
	group.members = keep
	group.reset_route()
	var other = Group.new()
	other.members = leave
	other.reset_route()
	groups.append(other)
	refresh_control()
	for actor in other.members:
		actor.enter_idle()
	message = "Group split. R changes groups; Tab changes the selected group's leader."
	return true

func cancel_regroup() -> void:
	returning.clear()
	for actor in roster:
		actor.velocity = Vector2.ZERO
		actor.set_facing(actor.facing_direction, false)

func recall_in_progress() -> bool:
	return not returning.is_empty()

func can_change_world_scene() -> bool:
	# Door/scene-transition triggers must wait until recall finishes or is cancelled.
	return not recall_in_progress() and not group_is_jumping()

func _return_route(actor: Node, destination: Vector2) -> PackedVector2Array:
	var path: PackedVector2Array = navigation.find_route(actor.global_position, destination)
	# A replanned grid path begins at the current cell center. Skip that
	# backward step only when the actor's full collision shape can reach the next point.
	if path.size() > 1 and not actor.test_move(actor.global_transform, path[1] - actor.global_position):
		path.remove_at(0)
	return path

func request_regroup() -> void:
	if group_is_jumping():
		message = "Land before recalling other groups."
		return
	returning.clear()
	var blocked: int = 0
	var tail: Vector2 = active_group().members[-1].global_position
	for group in groups:
		if group == active_group():
			continue
		var paths: Dictionary = {}
		for actor in group.members:
			var path: PackedVector2Array = _return_route(actor, tail)
			if path.is_empty():
				blocked += 1
				paths.clear()
				break
			paths[actor.character_id] = path
		if not paths.is_empty():
			returning[group] = {"paths": paths, "target": tail}
	message = "Regrouping: reachable groups fast-walk back."
	if blocked > 0:
		message = "%d group(s) blocked. Use R to find another route, or open the gate." % blocked
	if groups.size() == 1:
		message = "Everyone is already together."

func _physics_process(delta: float) -> void:
	if groups.is_empty():
		return
	active_group().record()
	active_group().follow(delta)
	_update_returns(delta)
	camera.global_position = active_group().members[0].global_position

func _update_returns(delta: float) -> void:
	for group in returning.keys():
		var state: Dictionary = returning[group]
		var tail: Vector2 = active_group().members[-1].global_position
		if tail.distance_to(state.target) > 5.0:
			# Revalidate rather than walk toward a stale destination after the player moves.
			for actor in group.members:
				state.paths[actor.character_id] = _return_route(actor, tail)
			state.target = tail
		var arrived: bool = true
		var blocked: bool = false
		for actor in group.members:
			var path: PackedVector2Array = state.paths[actor.character_id]
			var previous: Vector2 = actor.global_position
			if path.is_empty() and previous.distance_to(tail) > 12.0:
				blocked = true
				break
			while not path.is_empty() and actor.global_position.distance_to(path[0]) < 2.0:
				path.remove_at(0)
			if not path.is_empty() and actor.global_position.distance_to(tail) > 12.0:
				var motion: Vector2 = actor.global_position.direction_to(path[0]) * minf(145.0 * delta, actor.global_position.distance_to(path[0]))
				if actor.test_move(actor.global_transform, motion):
					blocked = true
					break
				actor.move_and_collide(motion)
			state.paths[actor.character_id] = path
			var moved: Vector2 = actor.global_position - previous
			actor.set_facing(actor.get_direction_name(moved) if moved.length_squared() > 0.001 else actor.facing_direction,
				moved.length_squared() > 0.001)
			if actor.global_position.distance_to(tail) > 12.0:
				arrived = false
		if blocked:
			returning.erase(group)
			for actor in group.members:
				actor.set_facing(actor.facing_direction, false)
			message = "Return route blocked. Switch groups with R and find a passable route."
		elif arrived:
			active_group().members.append_array(group.members)
			returning.erase(group)
			var selected = active_group()
			groups.erase(group)
			active_index = groups.find(selected)
			selected.reset_route()
			refresh_control()
			message = "Group rejoined. %d group(s) remain." % groups.size()

func full_party_present() -> bool:
	return groups.size() == 1 and active_group().members.size() == roster.size()
