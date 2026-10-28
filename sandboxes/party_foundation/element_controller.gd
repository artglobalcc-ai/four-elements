extends Node2D

# Short overworld casts share targeting/delivery, not combat actions or water carrying.
var owner_actor: Node
var world: Node
var definition: Resource
var refusal_message: String = "The object cannot react right now."
var selected: bool = false
var casting: bool = false
var effect_position := Vector2.ZERO
var target_position := Vector2.ZERO
var cast_direction := Vector2.RIGHT
var target: Node2D
var effect_age: float = 0.0
var tint := Color.WHITE

func _ready() -> void:
	z_index = 4

func payload() -> Dictionary:
	return {"technique_id": definition.technique_id, "source": owner_actor.character_id,
		"utilities": definition.utilities, "properties": definition.material_properties,
		"strength": definition.strength, "direction": cast_direction}

func select_technique(actor: Node) -> bool:
	if get_tree().paused or actor != owner_actor or not definition.allowed_characters.has(actor.character_id):
		return false
	selected = true
	world.manager.message = "%s selected. Click its matching test object; right-click cancels." % definition.display_name
	return true

func cancel() -> void:
	selected = false
	casting = false
	target = null
	queue_redraw()

func clear_path(from: Vector2, to: Vector2, intended: Node = null) -> bool:
	var query := PhysicsRayQueryParameters2D.create(from,to,1)
	var hit: Dictionary = get_world_2d().direct_space_state.intersect_ray(query)
	return hit.is_empty() or (intended != null and intended.has_method("obstacle_rect") and hit.collider == intended.collision_body)

func click_at(actor: Node, point: Vector2) -> bool:
	if get_tree().paused or actor != owner_actor or not selected or casting:
		return false
	var candidate: Node2D
	var closest: float = INF
	for object in get_tree().get_nodes_in_group("sandbox_environment_targets"):
		var distance: float = object.global_position.distance_to(point)
		if distance < closest and distance <= object.radius + 5:
			candidate = object
			closest = distance
	if candidate == null or not candidate.can_receive(payload()):
		world.manager.message = "Choose a compatible object for %s." % definition.display_name
		return false
	if owner_actor.global_position.distance_to(candidate.global_position) > definition.control_range:
		world.manager.message = "Move closer: target is outside bending range."
		return false
	if not clear_path(owner_actor.global_position,candidate.global_position,candidate):
		world.manager.message = "The bending path is blocked."
		return false
	target = candidate
	target_position = candidate.global_position
	effect_position = owner_actor.global_position
	cast_direction = effect_position.direction_to(target_position)
	casting = true
	effect_age = 0.0
	return true

func _physics_process(delta: float) -> void:
	if not casting:
		return
	effect_age += delta
	if not is_instance_valid(target) or target.global_position.distance_to(target_position) > 2.0:
		casting = false
		queue_redraw()
		return
	var next := effect_position.move_toward(target_position,definition.control_speed * delta)
	if not clear_path(effect_position,next,target):
		casting = false
		world.manager.message = "Bending stopped by an obstacle."
	else:
		effect_position = next
		if effect_position.distance_to(target_position) < 0.1:
			casting = false
			var applied: bool = target.receive_interaction(payload())
			world.manager.message = "%s: interaction complete." % definition.display_name if applied else refusal_message
	queue_redraw()

func _draw() -> void:
	if not casting:
		return
	var p := to_local(effect_position)
	if definition.material_properties.has(&"freezing"):
		draw_circle(p,5,Color("b8efff"))
		for i in range(3):
			var axis := Vector2.from_angle(i*PI/3)*8
			draw_line(p-axis,p+axis,Color("f0fdff"),1)
	elif definition.material_properties.has(&"earth"):
		draw_rect(Rect2(p-Vector2(5,5),Vector2(10,10)),tint)
		draw_line(p+Vector2(-3,-2),p+Vector2(2,3),Color("4b4137"),1)
	elif definition.material_properties.has(&"air"):
		for i in range(3):
			draw_arc(p-cast_direction*i*5,5+i*2,effect_age*10,effect_age*10+4.4,18,tint,1.5)
	else:
		draw_circle(p,5,tint)
		draw_circle(p-cast_direction*3,3,Color("ffe290"))
		draw_line(p-cast_direction*13,p,tint,3)
