extends Node2D

signal state_changed(target: Node, result: StringName)
@export var object_id: StringName
@export_enum("source", "reservoir", "vessel", "fire") var kind: String = "source"
@export var reaction_profile: Resource
@export var ignition_profile: Resource
const WaterMaterial = preload("res://sandboxes/party_foundation/water_material.gd")
var water_material = WaterMaterial.new()
var world: Node
var source_label: String = "Water"
var frozen: bool:
	get: return water_material.frozen
	set(value): water_material.frozen = value
var filled: bool:
	get: return water_material.has_water()
	set(value): water_material.amount = 1 if value else 0
var water_amount: int:
	get: return water_material.amount
	set(value): water_material.amount = maxi(0,value)
var burning: bool = true
var reactions_applied: int = 0
var animation_time: float = 0.0
var radius: float = 17.0

func _ready() -> void:
	# Pools/puddles are floor surfaces. Containers and flames sort with actors.
	z_index = 0 if kind == "source" else 1
	water_material.renewable = kind == "source"
	add_to_group("sandbox_environment_targets")

func _physics_process(delta: float) -> void:
	animation_time += delta
	queue_redraw()

func contains_water_material() -> bool:
	return kind in ["source","reservoir","vessel"]

func is_available_source() -> bool:
	return contains_water_material() and water_material.can_draw()

func take_water() -> bool:
	if not contains_water_material() or not water_material.draw_unit():
		return false
	state_changed.emit(self,&"drained")
	queue_redraw()
	return true

func can_receive(payload: Dictionary) -> bool:
	if payload.get("properties",[]).has(&"freezing"):
		return contains_water_material() and water_material.accepts_freeze(payload)
	if ignition_profile != null and ignition_profile.accepts(payload):
		return kind == "fire"
	if reaction_profile == null or not reaction_profile.accepts(payload):
		return false
	if reaction_profile.result == &"fill":
		return contains_water_material() and water_material.can_fill()
	if reaction_profile.result == &"extinguish":
		return kind == "fire" and burning
	return false

func receive_interaction(payload: Dictionary) -> bool:
	if not can_receive(payload):
		return false
	if contains_water_material() and water_material.accepts_freeze(payload):
		if frozen and kind == "source" and world != null:
			for actor in world.manager.roster:
				if actor.global_position.distance_to(global_position) <= radius+5.0:
					return false
		frozen = not frozen
		reactions_applied += 1
		state_changed.emit(self,&"freeze" if frozen else &"thaw")
		queue_redraw()
		return true
	if ignition_profile != null and ignition_profile.accepts(payload):
		burning = not burning
		reactions_applied += 1
		state_changed.emit(self,&"ignite" if burning else &"extinguish")
		queue_redraw()
		return true
	if reaction_profile.result == &"fill":
		water_material.fill_unit()
	elif reaction_profile.result == &"extinguish":
		burning = false
	reactions_applied += 1
	state_changed.emit(self, reaction_profile.result)
	queue_redraw()
	return true

func _draw() -> void:
	var font: Font = ThemeDB.fallback_font
	if kind == "source":
		draw_circle(Vector2.ZERO, radius + 3, Color("7aacc1"))
		draw_circle(Vector2.ZERO, radius, Color("b7e8f2") if frozen else (Color("277dc0") if filled else Color("91a5a4")))
		for i in range(3) if filled and not frozen else range(0):
			var ripple: float = fmod(animation_time * 8 + i * 6, radius)
			draw_arc(Vector2.ZERO, ripple, 0, TAU, 24, Color(0.55, 0.9, 1, 0.65 * (1 - ripple / radius)))
		draw_string(font, Vector2(-23, 30), source_label + (" (ice)" if frozen else (" (empty)" if not filled else "")), HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("244451"))
	elif kind in ["reservoir","vessel"]:
		draw_rect(Rect2(-18, -13, 36, 26), Color("628c9c"))
		draw_rect(Rect2(-14, -9, 28, 18), Color("b7e8f2") if frozen else (Color("359cdb") if filled else Color("233e50")))
		if filled:
			draw_line(Vector2(-10, 0), Vector2(10, sin(animation_time * 3) * 2), Color("a4eaff"), 2)
		var title: String = "Water vessel" if kind == "vessel" else "Reservoir"
		draw_string(font, Vector2(-25, 28), title + (" (ice)" if frozen else (" (full)" if filled else " (empty)")), HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("244451"))
	else:
		draw_circle(Vector2.ZERO, 12, Color("665d59"))
		draw_line(Vector2(-9, 6), Vector2(9, -3), Color("694a32"), 4)
		if burning:
			var sway: float = sin(animation_time * 8) * 2
			draw_colored_polygon(PackedVector2Array([Vector2(-8, 4), Vector2(-6, -8), Vector2(-2+sway, -19), Vector2(2,-6), Vector2(6+sway,-12), Vector2(9,4)]), Color("ef8534"))
			draw_circle(Vector2(0,-2), 4 + sin(animation_time * 10), Color("ffd56a"))
		draw_string(font, Vector2(-18, 27), "Fire" if burning else "Extinguished", HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("244451"))
