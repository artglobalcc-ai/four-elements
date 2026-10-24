
extends Control

@onready var slot_overlay: Control = $InventoryPanel/SlotOverlay

var active_inventory: Node = null
var viewed_character_index: int = 0


func _ready() -> void:
	# Connect all 8 personal storage slots.
	for i in range(8):
		connect_slot("StorageSlot" + str(i + 1), "storage", i)

	# Connect all 6 hotbar slots.
	for i in range(6):
		connect_slot("HotbarSlot" + str(i + 1), "hotbar", i)

	# Connect all 6 equipment slots.
	var equipment_slots: Array[String] = [
		"HeadSlot",
		"UpperBodySlot",
		"LowerBodySlot",
		"Trinket1Slot",
		"Trinket2Slot",
		"BackpackSlot"
	]

	for slot_name in equipment_slots:
		var slot: Button = slot_overlay.get_node_or_null(slot_name)

		if slot == null:
			push_warning("Missing equipment button: " + slot_name)
			continue

		slot.pressed.connect(_on_equipment_pressed.bind(slot_name))

	hide()


func connect_slot(slot_name: String, slot_type: String, index: int) -> void:
	var slot: Button = slot_overlay.get_node_or_null(slot_name)

	if slot == null:
		push_warning("Missing inventory button: " + slot_name)
		return

	slot.pressed.connect(_on_slot_pressed.bind(slot_type, index))

	# Find or create the item's icon.
	var icon: TextureRect = slot.get_node_or_null("ItemIcon")

	if icon == null:
		icon = TextureRect.new()
		icon.name = "ItemIcon"
		slot.add_child(icon)

	icon.set_anchors_and_offsets_preset(
		Control.PRESET_FULL_RECT
	)
	icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	icon.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	icon.texture = null


func get_party_controller() -> Node:
	return get_tree().current_scene.get_node_or_null(
		"PartyController"
	)


func set_viewed_character(index: int) -> void:
	var party_controller: Node = get_party_controller()

	if party_controller == null:
		push_warning("PartyController not found.")
		return

	if party_controller.party.is_empty():
		return

	if index < 0 or index >= party_controller.party.size():
		return

	viewed_character_index = index

	var character: CharacterBody2D = party_controller.party[index]
	active_inventory = character.get_node_or_null("Inventory")

	if active_inventory == null:
		push_warning("Inventory not found for " + character.name)
		return

	refresh_inventory()

	print("Viewing inventory: ", character.name)


func switch_viewed_character() -> void:
	var party_controller: Node = get_party_controller()

	if party_controller == null or party_controller.party.is_empty():
		return

	var next_index: int = (
		viewed_character_index + 1
	) % party_controller.party.size()

	set_viewed_character(next_index)


func refresh_inventory() -> void:
	if active_inventory == null:
		return

	for i in range(8):
		update_slot(
			"StorageSlot" + str(i + 1),
			active_inventory.storage[i]
		)

	for i in range(6):
		update_slot(
			"HotbarSlot" + str(i + 1),
			active_inventory.hotbar[i]
		)


func update_slot(slot_name: String, item) -> void:
	var slot: Button = slot_overlay.get_node_or_null(slot_name)

	if slot == null:
		return

	var icon: TextureRect = slot.get_node_or_null("ItemIcon")

	if icon == null:
		return

	if item is ItemData:
		icon.texture = item.icon
	else:
		icon.texture = null


func _unhandled_key_input(event: InputEvent) -> void:
	if not event is InputEventKey:
		return

	if not event.pressed or event.echo:
		return

	if event.keycode == KEY_E:
		toggle_inventory()
		get_viewport().set_input_as_handled()

	elif event.keycode == KEY_TAB and visible:
		switch_viewed_character()
		get_viewport().set_input_as_handled()


func toggle_inventory() -> void:
	if visible:
		hide()
		get_tree().paused = false
	else:
		set_viewed_character(0)
		show()
		get_tree().paused = true


func _on_slot_pressed(slot_type: String, index: int) -> void:
	print(slot_type, " slot ", index + 1, " clicked!")


func _on_equipment_pressed(slot_name: String) -> void:
	print("Equipment slot clicked: ", slot_name)
