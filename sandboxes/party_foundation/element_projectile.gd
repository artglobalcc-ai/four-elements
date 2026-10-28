extends "res://sandboxes/party_foundation/element_controller.gd"

var requires_water: bool = false
var damage: float = 20.0 # Fragile sandbox crate: provisional, not combat balance.

func payload() -> Dictionary:
	var result: Dictionary = super.payload()
	result["damage"] = damage
	return result

func select_technique(actor: Node) -> bool:
	if not super.select_technique(actor):
		return false
	world.manager.message = "%s selected. Click to shoot; right-click cancels." % definition.display_name
	return true

func click_at(actor: Node, point: Vector2) -> bool:
	if get_tree().paused or actor != owner_actor or not selected or casting:
		return false
	if requires_water and (not world.water.carrying or world.water.releasing):
		world.manager.message = "Collect water with 1 before using Water Shot (2)."
		return false
	var offset: Vector2 = point-owner_actor.global_position
	if offset.length_squared()<1:
		return false
	effect_position = owner_actor.global_position
	target_position = effect_position+offset.limit_length(definition.control_range)
	cast_direction = offset.normalized()
	casting = true
	effect_age = 0.0
	if requires_water:
		# Launch from the held water's actual position, retaining a bounded trajectory.
		effect_position = world.water.water_position
		cast_direction = effect_position.direction_to(target_position)
		world.water.cancel("Water launched.")
	return true

func _physics_process(delta: float) -> void:
	if not casting:
		return
	effect_age += delta
	var next := effect_position.move_toward(target_position,definition.control_speed*delta)
	var query := PhysicsRayQueryParameters2D.create(effect_position,next,1)
	var hit: Dictionary = get_world_2d().direct_space_state.intersect_ray(query)
	if not hit.is_empty():
		effect_position = hit.position
		casting = false
		var object: Node = hit.collider
		if object.has_method("receive_interaction") and object.can_receive(payload()):
			object.receive_interaction(payload())
			world.refresh_navigation()
			world.manager.message = "Element hit: object reacted."
		else:
			world.manager.message = "Element stopped by an obstacle."
	else:
		effect_position = next
		if effect_position.distance_to(target_position)<0.1:
			casting = false
	queue_redraw()

func _draw() -> void:
	if definition.material_properties.has(&"water"):
		if casting:
			draw_circle(to_local(effect_position),5,Color("359cdb"))
			draw_arc(to_local(effect_position),6,0,TAU,16,Color("a4eaff"),1)
	else:
		super._draw()
