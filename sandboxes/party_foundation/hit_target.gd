extends StaticBody2D

signal struck(target: Node, result: Dictionary)
@export var target_id: StringName = &"crate"
@export var max_health: float = 20.0
@export var required_force: float = 1.0
var health: float = 20.0
var flash: float = 0.0
var hit_count: int = 0
var broken: bool = false
var kind: String = "crate"
var radius: float = 15.0
var mechanism: bool = false
var activated: bool = false

func _ready() -> void:
	z_index = 1
	add_to_group("sandbox_hit_targets")
	add_to_group("sandbox_environment_targets")
	health = max_health
	var collision := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = Vector2(20,20)
	collision.shape = shape
	add_child(collision)

func is_available_source() -> bool:
	return false

func can_receive(payload: Dictionary) -> bool:
	var properties: Array = payload.get("properties",[])
	return not broken and payload.get("utilities",[]).has(&"strike_targets") and float(payload.get("strength",0)) >= required_force and (properties.has(&"water") or properties.has(&"earth") or properties.has(&"fire") or properties.has(&"air"))

func receive_interaction(payload: Dictionary) -> bool:
	if not can_receive(payload):
		return false
	return receive_hit({"utility":&"strike_targets","force":payload.get("strength",0),"damage":payload.get("damage",max_health)}).get("accepted",false)

func receive_hit(payload: Dictionary) -> Dictionary:
	if broken or payload.get("utility") != &"strike_targets" or float(payload.get("force",0)) < required_force:
		return {"accepted":false}
	hit_count += 1
	health = maxf(0,health - float(payload.get("damage",0)))
	flash = 0.18
	if mechanism:
		activated = not activated
		health = max_health
	elif health == 0:
		broken = true
		get_child(0).set_deferred("disabled",true)
	var result := {"accepted":true,"broken":broken,"health":health}
	struck.emit(self,result)
	queue_redraw()
	return result

func _physics_process(delta: float) -> void:
	if flash > 0:
		flash = maxf(0,flash-delta)
		queue_redraw()

func _draw() -> void:
	if mechanism:
		draw_rect(Rect2(-10,-10,20,20),Color("77bd7c") if activated else Color("84959b"))
		draw_circle(Vector2.ZERO,5,Color("ffdd77") if activated else Color("3b505b"))
		return
	if broken:
		draw_line(Vector2(-10,7),Vector2(3,-5),Color("775037"),3)
		draw_line(Vector2(3,6),Vector2(12,9),Color("775037"),3)
		return
	draw_rect(Rect2(-10,-10,20,20),Color.WHITE if flash > 0 else Color("a6774b"))
	draw_rect(Rect2(-10,-10,20,20),Color("684c39"),false,2)
	draw_line(Vector2(-8,-8),Vector2(8,8),Color("684c39"),2)
	draw_line(Vector2(8,-8),Vector2(-8,8),Color("684c39"),2)
	draw_rect(Rect2(-10,-15,20*health/max_health,2),Color("498f6f"))
