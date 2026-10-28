extends Node2D

# Dedicated sandbox props: no general-purpose destruction or logical elevation system.
signal state_changed(target: Node, result: StringName)
var kind: String = "earth"
var reaction_profile: Resource
var reaction_profiles: Array[Resource] = []
var world: Node
var radius: float = 16.0
var raised: bool = false:
	set(value):
		raised = value
		if kind == "earth":
			z_index = 1 if value else 0
var reactions_applied: int = 0
var collision_body: StaticBody2D
var animation_time: float = 0.0

func _ready() -> void:
	z_index = 0 if kind == "earth" and not raised else 1
	if kind == "earth":
		var ground := Node2D.new()
		ground.z_as_relative = false
		ground.z_index = 0
		ground.show_behind_parent = true
		ground.draw.connect(func(): ground.draw_circle(Vector2.ZERO,15,Color("87956a")))
		add_child(ground)
	add_to_group("sandbox_environment_targets")
	add_to_group("sandbox_bending_obstacles")
	collision_body = StaticBody2D.new()
	collision_body.collision_layer = 1
	var shape := CollisionShape2D.new()
	var rectangle := RectangleShape2D.new()
	rectangle.size = Vector2(18,18)
	shape.shape = rectangle
	shape.disabled = kind == "earth"
	collision_body.add_child(shape)
	add_child(collision_body)

func obstacle_rect() -> Rect2:
	return Rect2(global_position-Vector2(9,9),Vector2(18,18)) if kind == "air" or raised else Rect2()

func is_available_source() -> bool:
	return false

func matching_reaction(payload: Dictionary) -> Resource:
	for profile in reaction_profiles:
		if profile.accepts(payload):
			return profile
	return reaction_profile if reaction_profile != null and reaction_profile.accepts(payload) else null

func can_receive(payload: Dictionary) -> bool:
	return matching_reaction(payload) != null

func receive_interaction(payload: Dictionary) -> bool:
	var reaction: Resource = matching_reaction(payload)
	if reaction == null:
		return false
	if reaction.result == &"reshape":
		if not raised:
			for actor in world.manager.roster:
				if global_position.distance_to(actor.global_position) < 21:
					return false
		raised = not raised
		collision_body.get_child(0).set_deferred("disabled",not raised)
	else:
		var direction: Vector2 = payload.get("direction",Vector2.RIGHT)
		var motion := direction.normalized() * 32.0
		var destination := global_position + motion
		if not world.BOUNDS.encloses(Rect2(destination-Vector2(10,10),Vector2(20,20))):
			return false
		for actor in world.manager.roster:
			var nearest := Geometry2D.get_closest_point_to_segment(actor.global_position,global_position,destination)
			if nearest.distance_to(actor.global_position) < 21:
				return false
		var query := PhysicsShapeQueryParameters2D.new()
		query.shape = collision_body.get_child(0).shape
		query.transform = global_transform
		query.motion = motion
		query.collision_mask = 1
		query.exclude = [collision_body.get_rid()]
		var clearance: PackedFloat32Array = get_world_2d().direct_space_state.cast_motion(query)
		if clearance[0] < 1.0:
			return false
		global_position = destination
	reactions_applied += 1
	world.refresh_navigation()
	state_changed.emit(self,reaction.result)
	queue_redraw()
	return true

func _physics_process(delta: float) -> void:
	animation_time += delta
	queue_redraw()

func _draw() -> void:
	var font := ThemeDB.fallback_font
	if kind == "earth":
		draw_rect(Rect2(-9,-9 if not raised else -21,18,18 if not raised else 30),Color("84735a") if raised else Color("aa9977"))
		draw_line(Vector2(-6,-5),Vector2(5,4),Color("514b3e"),2)
	else:
		draw_rect(Rect2(-9,-9,18,18),Color("d1c3a0"))
		draw_arc(Vector2.ZERO,6,animation_time,animation_time+4.0,16,Color("efffff"),2)
	draw_string(font,Vector2(-28,28),"Stone: raised" if raised else ("Stone: lowered" if kind == "earth" else "Air push block"),HORIZONTAL_ALIGNMENT_LEFT,-1,8,Color("244451"))
