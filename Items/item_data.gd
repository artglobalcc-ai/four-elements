
extends Resource
class_name ItemData

@export var item_id: String = ""
@export var item_name: String = ""
@export_multiline var description: String = ""

@export var icon: Texture2D

enum ItemCategory {
	WEAPON,
	TOOL,
	FOOD,
	MATERIAL,
	ARMOR,
	TRINKET,
	QUEST,
	TREASURE,
	MISC
}

@export var category: ItemCategory = ItemCategory.MISC

@export_range(1, 999) var max_stack: int = 1

@export var usable_by: Array[String] = []
@export var transferable: bool = true
@export var craftable: bool = false
@export var sellable: bool = true
@export var value: int = 0


# CONSUMPTION
# Food, potions, and other single-use items.
@export_group("Consumption")
@export var consumable: bool = false

# DURABILITY
# Optional wear for tools and selected equipment.
@export_group("Durability")
@export var uses_durability: bool = false
@export_range(0, 9999) var max_durability: int = 100

# FUEL
# For lanterns and other refillable equipment.
@export_group("Fuel")
@export var uses_fuel: bool = false
@export_range(0.0, 99999.0) var max_fuel: float = 0.0

# LIGHTING
# How far an item can illuminate its surroundings.
@export_group("Lighting")
@export_range(0.0, 100.0) var light_radius: float = 0.0
