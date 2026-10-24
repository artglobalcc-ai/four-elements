
extends Resource
class_name ItemStack

@export var item: ItemData
@export_range(1, 999) var quantity: int = 1


func _init(
	p_item: ItemData = null,
	p_quantity: int = 1
) -> void:
	item = p_item
	quantity = p_quantity


func can_stack_with(other: ItemStack) -> bool:
	if other == null:
		return false

	if item == null or other.item == null:
		return false

	return item.item_id == other.item.item_id


func available_space() -> int:
	if item == null:
		return 0

	return maxi(0, item.max_stack - quantity)
