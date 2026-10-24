
extends Node

const BASE_STORAGE_SLOTS: int = 8
const HOTBAR_SLOTS: int = 6

var storage: Array = []
var hotbar: Array = []
var equipment: Dictionary = {}

var selected_hotbar_slot: int = 0


func _ready() -> void:
	storage.resize(BASE_STORAGE_SLOTS)
	hotbar.resize(HOTBAR_SLOTS)

	equipment = {
		"head": null,
		"body": null,
		"feet": null,
		"trinket_1": null,
		"trinket_2": null,
		"backpack": null
	}

	# Give Sokka his starting club.
	if get_parent().name == "Sokka":
		var club: ItemData = load(
			"res://Items/sokkas_club.tres"
		)
		storage[0] = ItemStack.new(club, 1)
		print("Sokka's starting item: ", storage[0].item.item_name)

	# Give Katara 15 Fish for stack testing.
	if get_parent().name == "Katara":
		var fish: ItemData = load(
			"res://Items/fish1.tres"
		)
		storage[0] = ItemStack.new(fish, 15)
		print("Katara's starting item: ", storage[0].item.item_name)
		print("Fish quantity: ", storage[0].quantity)

	print(get_parent().name, " inventory initialized.")
	print("Storage slots: ", storage.size())
	print("Hotbar slots: ", hotbar.size())


func expand_storage(extra_slots: int) -> void:
	if extra_slots <= 0:
		return

	storage.resize(storage.size() + extra_slots)
	print("Storage expanded to ", storage.size(), " slots.")


func select_hotbar_slot(slot: int) -> void:
	if slot < 0 or slot >= HOTBAR_SLOTS:
		return

	selected_hotbar_slot = slot
	print(
		get_parent().name,
		" selected hotbar slot ",
		slot + 1
	)
