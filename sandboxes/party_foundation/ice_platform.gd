extends Node2D

signal state_changed(target: Node, result: StringName)
var world: Node
var radius: float = 50.0
const WaterMaterial = preload("res://sandboxes/party_foundation/water_material.gd")
var water_material = WaterMaterial.new()
var frozen: bool:
	get: return water_material.frozen
	set(value): water_material.frozen = value
var kind: String = "ice_crossing"
var collision_body: StaticBody2D
var footprint := Rect2(-48,-12,96,24)

func _ready() -> void:
	# A walkable surface is floor artwork, never a foreground occluder.
	z_index = 0
	water_material.renewable = true
	add_to_group("sandbox_environment_targets")
	add_to_group("sandbox_bending_obstacles")
	collision_body = StaticBody2D.new()
	var collider := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = footprint.size
	collider.shape = shape
	collision_body.add_child(collider)
	add_child(collision_body)

func obstacle_rect() -> Rect2:
	return Rect2(global_position+footprint.position,footprint.size) if not frozen else Rect2()

func is_available_source() -> bool:
	return water_material.can_draw()

func take_water() -> bool:
	if not water_material.draw_unit():
		return false
	state_changed.emit(self,&"drained")
	return true

func water_pickup_point(from: Vector2) -> Vector2:
	# Draw at the accessible shoreline; never route held water through liquid collision.
	var local := to_local(from)
	var edge := local.clamp(footprint.position,footprint.end)
	var direction := (local-edge).normalized()
	if direction.length_squared()<0.01:
		direction = Vector2.DOWN
		edge.y = footprint.end.y
	return to_global(edge+direction*18.0)

func can_receive(payload: Dictionary) -> bool:
	return water_material.accepts_freeze(payload)

func occupied() -> bool:
	# Include actors' collision radius, not only their center, and inspect all groups.
	for actor in world.manager.roster:
		if footprint.grow(5.0).has_point(to_local(actor.global_position)):
			return true
	return false

func receive_interaction(payload: Dictionary) -> bool:
	if not can_receive(payload):
		return false
	if frozen and occupied():
		world.manager.message = "Cannot thaw: move everyone off the ice platform first."
		return false
	frozen = not frozen
	collision_body.get_child(0).set_deferred("disabled",frozen)
	world.refresh_navigation()
	state_changed.emit(self,&"freeze" if frozen else &"thaw")
	queue_redraw()
	return true

func _draw() -> void:
	draw_rect(footprint,Color("b7e8f2") if frozen else Color("287ead"))
	draw_rect(footprint,Color("689fad"),false,1)
	for i in range(5):
		var x: float = -40+i*18
		draw_line(Vector2(x,-7),Vector2(x+9,7),Color("eefcff") if frozen else Color("6cbfd4"),1)
	draw_string(ThemeDB.fallback_font,Vector2(-44,28),"Ice: cross safely" if frozen else "Water: 2 to freeze",HORIZONTAL_ALIGNMENT_LEFT,-1,8,Color("244451"))
