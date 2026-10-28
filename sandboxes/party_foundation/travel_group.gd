extends RefCounted

var members: Array = []
var route: Array[Vector2] = []
var distances: Array[float] = []
var travelled: float = 0.0
var cursors: Dictionary = {}
var jump_events: Array = []
var jump_serial: int = 0
var last_jumps: Dictionary = {}
var active_jumps: Dictionary = {}
const SPACING: float = 28.0
const MAX_POINTS: int = 4096

func reset_route() -> void:
	route.clear()
	distances.clear()
	cursors.clear()
	jump_events.clear()
	last_jumps.clear()
	active_jumps.clear()
	travelled = 0.0
	for i in range(members.size() - 1, -1, -1):
		var point: Vector2 = members[i].global_position
		if not route.is_empty():
			travelled += route[-1].distance_to(point)
		route.append(point)
		distances.append(travelled)
		cursors[members[i].character_id] = travelled
		last_jumps[members[i].character_id] = jump_serial

func record(force: bool = false) -> void:
	if members.is_empty():
		return
	var point: Vector2 = members[0].global_position
	if route.is_empty():
		reset_route()
	if point.distance_to(route[-1]) < 0.5 and not force:
		return
	travelled += point.distance_to(route[-1])
	route.append(point)
	distances.append(travelled)
	var oldest: float = travelled
	for i in range(1, members.size()):
		oldest = minf(oldest, float(cursors.get(members[i].character_id, travelled)))
	while route.size() > 2 and (distances[1] < oldest - 8.0 or route.size() > MAX_POINTS):
		route.pop_front()
		distances.pop_front()
	while not jump_events.is_empty() and jump_events[0].distance < distances[0]:
		jump_events.pop_front()

func point_at(distance: float) -> Vector2:
	if route.is_empty():
		return Vector2.ZERO
	var low: int = 0
	var high: int = distances.size() - 1
	while low < high:
		var middle: int = (low + high) / 2
		if distances[middle] < distance:
			low = middle + 1
		else:
			high = middle
	if low == 0:
		return route[0]
	var length: float = distances[low] - distances[low - 1]
	var fraction: float = clampf((distance - distances[low - 1]) / maxf(length, 0.001), 0, 1)
	return route[low - 1].lerp(route[low], fraction)

func remember_jump(direction: Vector2) -> void:
	record()
	jump_serial+=1
	jump_events.append({"id":jump_serial,"distance":travelled,"direction":direction,"ready":false})

func finish_jump(trace: Array) -> void:
	if trace.size()<2:
		return
	record(true)
	for event in jump_events:
		if not event.ready:
			event.trace=trace
			event.end_distance=travelled
			event.stationary=float(trace[-1].distance)<0.5
			event.ready=true
			last_jumps[members[0].character_id]=event.id
			break

func follow(delta: float) -> void:
	for i in range(1,members.size()):
		var actor = members[i]
		var previous: Vector2 = actor.global_position
		var cursor: float = float(cursors.get(actor.character_id,0.0))
		var target: float = maxf(distances[0],travelled-SPACING*i)
		if actor.is_jumping:
			advance_follower_jump(actor,delta)
			continue
		var pending: Dictionary = {}
		for event in jump_events:
			if event.id>int(last_jumps.get(actor.character_id,0)) and (event.distance<=target+0.01 or (event.ready and event.stationary)):
				pending=event
				break
		var stationary: bool = pending.get("ready",false) and pending.get("stationary",false)
		var walk_target: float = (cursor if stationary else minf(target,pending.distance)) if not pending.is_empty() else target
		if cursor>=distances[0]:
			var budget: float = actor.walk_speed*1.5*delta
			while cursor<walk_target and budget>0.001:
				var step: float = minf(2.0,minf(walk_target-cursor,budget))
				var point: Vector2 = point_at(cursor+step)
				var motion: Vector2 = point-actor.global_position
				if actor.test_move(actor.global_transform,motion):
					break
				if actor.world != null and absf(actor.world.terrain_height_at(point)-actor.ground_height)>0.01:
					break
				actor.global_position=point
				cursor+=step
				budget-=step
		cursors[actor.character_id]=cursor
		if not pending.is_empty() and pending.ready and (stationary or absf(cursor-pending.distance)<0.02):
			if actor.start_jump_replay(pending.trace,stationary):
				active_jumps[actor.character_id]={"event":pending,"start":cursor,"stationary":stationary}
				advance_follower_jump(actor,delta)
				continue
		var movement: Vector2 = actor.global_position-previous
		actor.set_facing(actor.get_direction_name(movement) if movement.length_squared()>0.001 else actor.facing_direction,movement.length_squared()>0.001)

	while not jump_events.is_empty():
		var first: Dictionary = jump_events[0]
		if not first.ready or not members.all(func(member): return int(last_jumps.get(member.character_id,0))>=int(first.id)):
			break
		jump_events.pop_front()

func advance_follower_jump(actor: Node, delta: float) -> void:
	var state: Dictionary = active_jumps.get(actor.character_id,{})
	if state.is_empty():
		return
	actor.update_jump(delta,true)
	if state.stationary:
		cursors[actor.character_id]=state.start
	else:
		var fraction: float = actor.replay_distance/maxf(0.001,float(state.event.trace[-1].distance))
		cursors[actor.character_id]=state.start+(state.event.end_distance-state.event.distance)*fraction
	if not actor.is_jumping:
		if actor.last_jump_succeeded:
			last_jumps[actor.character_id]=state.event.id
		else:
			cursors[actor.character_id]=state.start
		active_jumps.erase(actor.character_id)
