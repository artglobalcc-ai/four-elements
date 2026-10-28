extends Resource

# Each placed body/container owns its state; no shared mutable global water supply.
@export var bending_allowed: bool = true
@export var renewable: bool = false
@export var amount: int = 0
@export var capacity: int = 1
@export var frozen: bool = false

func has_water() -> bool:
	return renewable or amount > 0

func can_draw() -> bool:
	return bending_allowed and not frozen and has_water()

func draw_unit() -> bool:
	if not can_draw():
		return false
	if not renewable:
		amount -= 1
	return true

func can_fill() -> bool:
	return bending_allowed and not frozen and not renewable and amount < capacity

func fill_unit() -> bool:
	if not can_fill():
		return false
	amount += 1
	return true

func accepts_freeze(payload: Dictionary) -> bool:
	return bending_allowed and has_water() and payload.get("source") == &"katara" and payload.get("utilities",[]).has(&"modify_material_state") and payload.get("properties",[]).has(&"freezing")
