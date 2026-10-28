extends Node2D

# A designated terrain support surface; props never register here.
@export var footprint := Rect2(Vector2.ZERO,Vector2(96,64))
@export var elevation: float = 16.0
@export_flags_2d_physics var collision_bit: int = 4

func world_rect() -> Rect2:
	return Rect2(global_position+footprint.position,footprint.size)

func _ready() -> void:
	z_index = 0
	var body := StaticBody2D.new()
	body.collision_layer = collision_bit
	body.collision_mask = 0
	body.position = footprint.get_center()
	var shape := RectangleShape2D.new()
	shape.size = footprint.size
	var collider := CollisionShape2D.new()
	collider.shape = shape
	body.add_child(collider)
	add_child(body)

func _draw() -> void:
	var top := Rect2(footprint.position-Vector2(0,elevation),footprint.size)
	draw_rect(footprint,Color("647d86"))
	draw_rect(top,Color("c2dce0"))
	draw_rect(top,Color("749daa"),false,1)
	draw_string(ThemeDB.fallback_font,top.position+Vector2(5,16),"Low ledge" if elevation<20 else "Too high",HORIZONTAL_ALIGNMENT_LEFT,-1,9,Color("244451"))
