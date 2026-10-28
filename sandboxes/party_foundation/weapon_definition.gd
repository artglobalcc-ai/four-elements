extends Resource

# Authorable attack timing and hit rules, independent of sprite artwork.
@export var item: ItemData
@export var damage: float = 10.0
@export var force: float = 1.0
@export var reach: float = 42.0
@export_range(1.0,180.0) var half_angle_degrees: float = 65.0
@export var windup: float = 0.12
@export var active_time: float = 0.10
@export var recovery: float = 0.20
@export var utility: StringName = &"strike_targets"
@export var element: StringName = &"physical"
@export var animation_prefix: String = "attack_"
