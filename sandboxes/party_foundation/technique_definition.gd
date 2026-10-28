extends Resource

@export var technique_id: StringName = &"water_manipulation"
@export var display_name: String = "Water Manipulation"
@export var allowed_characters: Array[StringName] = [&"katara"]
@export var utilities: Array[StringName] = [&"move_objects", &"modify_material_state"]
@export var material_properties: Array[StringName] = [&"water"]
@export var strength: float = 1.0
@export var control_range: float = 96.0
@export var control_speed: float = 150.0
@export var concentration_seconds: float = 45.0
