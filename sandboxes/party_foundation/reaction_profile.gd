extends Resource

@export var required_utility: StringName = &"move_objects"
@export var required_property: StringName = &"water"
@export var minimum_strength: float = 1.0
@export var result: StringName = &"fill"

func accepts(payload: Dictionary) -> bool:
	return payload.get("utilities", []).has(required_utility) \
		and payload.get("properties", []).has(required_property) \
		and float(payload.get("strength", 0)) >= minimum_strength
