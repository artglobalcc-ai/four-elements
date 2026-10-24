extends Control

@onready var slot_overlay: Control = $InventoryPanel/SlotOverlay
@onready var character_portrait: TextureRect = $InventoryPanel/CharacterPortrait

const SOKKA_PORTRAIT = preload("res://assets/characters/sokka/frames/idle_down.png")

var active_inventory: Node = null
var viewed_character_index: int = 0
var katara_portrait: Texture2D = null

var held_stack: ItemStack = null
var held_origin_inventory: Node = null
var held_origin_type: String = ""
var held_origin_index: int = -1

var cursor_icon: TextureRect = null
var cursor_count: Label = null


func _ready() -> void:
	katara_portrait = character_portrait.texture
	character_portrait.mouse_filter = Control.MOUSE_FILTER_IGNORE

	for i in range(8):
		connect_slot("StorageSlot" + str(i + 1), "storage", i)
	for i in range(6):
		connect_slot("HotbarSlot" + str(i + 1), "hotbar", i)

	for slot_name in ["HeadSlot", "UpperBodySlot", "LowerBodySlot", "Trinket1Slot", "Trinket2Slot", "BackpackSlot"]:
		var slot: Button = slot_overlay.get_node_or_null(slot_name)
		if slot == null:
			push_warning("Missing equipment button: " + slot_name)
			continue
		slot.focus_mode = Control.FOCUS_NONE
		slot.pressed.connect(_on_equipment_pressed.bind(slot_name))

	cursor_icon = TextureRect.new()
	cursor_icon.name = "CursorItemIcon"
	add_child(cursor_icon)
	cursor_icon.set_anchors_and_offsets_preset(Control.PRESET_TOP_LEFT)
	cursor_icon.size = Vector2(16, 16)
	cursor_icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	cursor_icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	cursor_icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	cursor_icon.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	cursor_icon.z_index = 100

	cursor_count = make_count_label(cursor_icon)
	cursor_icon.hide()
	hide()


func make_count_label(parent: Control) -> Label:
	var count_label := Label.new()
	count_label.name = "QuantityLabel"
	parent.add_child(count_label)
	count_label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	count_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	count_label.vertical_alignment = VERTICAL_ALIGNMENT_BOTTOM
	count_label.add_theme_font_size_override("font_size", 8)
	count_label.add_theme_color_override("font_color", Color.WHITE)
	count_label.add_theme_color_override("font_shadow_color", Color.BLACK)
	count_label.add_theme_constant_override("shadow_offset_x", 1)
	count_label.add_theme_constant_override("shadow_offset_y", 1)
	count_label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	return count_label


func _process(_delta: float) -> void:
	if held_stack != null and cursor_icon != null:
		cursor_icon.position = get_local_mouse_position() - cursor_icon.size / 2.0


func connect_slot(slot_name: String, slot_type: String, index: int) -> void:
	var slot: Button = slot_overlay.get_node_or_null(slot_name)
	if slot == null:
		push_warning("Missing inventory button: " + slot_name)
		return
	slot.focus_mode = Control.FOCUS_NONE
	slot.pressed.connect(_on_slot_pressed.bind(slot_type, index))
	slot.gui_input.connect(_on_slot_gui_input.bind(slot_type, index))

	var icon: TextureRect = slot.get_node_or_null("ItemIcon")
	if icon == null:
		icon = TextureRect.new()
		icon.name = "ItemIcon"
		slot.add_child(icon)
	icon.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	icon.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	icon.mouse_filter = Control.MOUSE_FILTER_IGNORE
	icon.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	icon.texture = null
	if icon.get_node_or_null("QuantityLabel") == null:
		make_count_label(icon)


func get_party_controller() -> Node:
	return get_tree().current_scene.get_node_or_null("PartyController")


func set_viewed_character(index: int) -> void:
	var controller: Node = get_party_controller()
	if controller == null:
		push_warning("PartyController not found.")
		return
	if controller.party.is_empty() or index < 0 or index >= controller.party.size():
		return
	viewed_character_index = index
	var character: CharacterBody2D = controller.party[index]
	active_inventory = character.get_node_or_null("Inventory")
	if active_inventory == null:
		push_warning("Inventory not found for " + character.name)
		return
	if character.name == "Sokka":
		character_portrait.texture = SOKKA_PORTRAIT
	elif character.name == "Katara":
		character_portrait.texture = katara_portrait
	refresh_inventory()
	print("Viewing inventory: ", character.name)


func switch_viewed_character() -> void:
	var controller: Node = get_party_controller()
	if controller == null or controller.party.is_empty():
		return
	set_viewed_character((viewed_character_index + 1) % controller.party.size())


func refresh_inventory() -> void:
	if active_inventory == null:
		return
	for i in range(8):
		update_slot("StorageSlot" + str(i + 1), active_inventory.storage[i])
	for i in range(6):
		update_slot("HotbarSlot" + str(i + 1), active_inventory.hotbar[i])


func update_slot(slot_name: String, stack: ItemStack) -> void:
	var slot: Button = slot_overlay.get_node_or_null(slot_name)
	if slot == null:
		return
	var icon: TextureRect = slot.get_node_or_null("ItemIcon")
	if icon == null:
		return
	var count_label: Label = icon.get_node_or_null("QuantityLabel")
	if stack != null and stack.item != null:
		icon.texture = stack.item.icon
		if count_label != null:
			count_label.text = str(stack.quantity) if stack.quantity > 1 else ""
	else:
		icon.texture = null
		if count_label != null:
			count_label.text = ""


func get_slot_stack(inventory: Node, slot_type: String, index: int) -> ItemStack:
	if inventory == null:
		return null
	if slot_type == "storage":
		if index >= 0 and index < inventory.storage.size():
			return inventory.storage[index]
	elif slot_type == "hotbar":
		if index >= 0 and index < inventory.hotbar.size():
			return inventory.hotbar[index]
	return null


func set_slot_stack(inventory: Node, slot_type: String, index: int, stack: ItemStack) -> void:
	if slot_type == "storage":
		inventory.storage[index] = stack
	elif slot_type == "hotbar":
		inventory.hotbar[index] = stack


func can_place_stack(stack: ItemStack, destination_inventory: Node) -> bool:
	if stack == null or stack.item == null:
		return true
	var character_name: String = destination_inventory.get_parent().name
	if not stack.item.usable_by.is_empty() and not stack.item.usable_by.has(character_name):
		return false
	if destination_inventory != held_origin_inventory and not stack.item.transferable:
		return false
	return true


func update_cursor_icon() -> void:
	if held_stack == null or held_stack.item == null:
		cursor_icon.texture = null
		cursor_count.text = ""
		cursor_icon.hide()
	else:
		cursor_icon.texture = held_stack.item.icon
		cursor_count.text = str(held_stack.quantity) if held_stack.quantity > 1 else ""
		cursor_icon.show()


func clear_held_stack() -> void:
	held_stack = null
	held_origin_inventory = null
	held_origin_type = ""
	held_origin_index = -1
	update_cursor_icon()


func pick_up_stack(inventory: Node, slot_type: String, index: int, take_half: bool) -> void:
	var stack: ItemStack = get_slot_stack(inventory, slot_type, index)
	if stack == null or stack.item == null:
		return
	held_origin_inventory = inventory
	held_origin_type = slot_type
	held_origin_index = index
	if take_half and stack.quantity > 1:
		var amount: int = ceili(stack.quantity / 2.0)
		held_stack = ItemStack.new(stack.item, amount)
		stack.quantity -= amount
	else:
		held_stack = stack
		set_slot_stack(inventory, slot_type, index, null)
	update_cursor_icon()
	refresh_inventory()


func place_held_stack(inventory: Node, slot_type: String, index: int, place_one: bool) -> void:
	if held_stack == null or not can_place_stack(held_stack, inventory):
		return
	var destination: ItemStack = get_slot_stack(inventory, slot_type, index)
	if destination == null:
		if place_one and held_stack.quantity > 1:
			set_slot_stack(inventory, slot_type, index, ItemStack.new(held_stack.item, 1))
			held_stack.quantity -= 1
		else:
			set_slot_stack(inventory, slot_type, index, held_stack)
			clear_held_stack()
	elif destination.can_stack_with(held_stack):
		var available: int = destination.available_space()
		var amount: int = mini(available, 1 if place_one else held_stack.quantity)
		if amount <= 0:
			return
		destination.quantity += amount
		held_stack.quantity -= amount
		if held_stack.quantity <= 0:
			clear_held_stack()
	elif not place_one:
		# The destination becomes the new held stack; restrictions follow its owner.
		set_slot_stack(inventory, slot_type, index, held_stack)
		held_stack = destination
		held_origin_inventory = inventory
		held_origin_type = slot_type
		held_origin_index = index
	update_cursor_icon()
	refresh_inventory()


func return_held_stack() -> void:
	if held_stack == null:
		return
	if held_origin_inventory == null:
		return
	var origin: ItemStack = get_slot_stack(held_origin_inventory, held_origin_type, held_origin_index)
	if origin == null:
		set_slot_stack(held_origin_inventory, held_origin_type, held_origin_index, held_stack)
		clear_held_stack()
		refresh_inventory()
		return
	if origin.can_stack_with(held_stack):
		var amount: int = mini(origin.available_space(), held_stack.quantity)
		origin.quantity += amount
		held_stack.quantity -= amount
		if held_stack.quantity <= 0:
			clear_held_stack()
			refresh_inventory()
			return
	for i in range(held_origin_inventory.storage.size()):
		if held_origin_inventory.storage[i] == null:
			held_origin_inventory.storage[i] = held_stack
			clear_held_stack()
			refresh_inventory()
			return
	for i in range(held_origin_inventory.hotbar.size()):
		if held_origin_inventory.hotbar[i] == null:
			held_origin_inventory.hotbar[i] = held_stack
			clear_held_stack()
			refresh_inventory()
			return
	push_warning("No space to return held item; inventory remains open.")


func _on_slot_pressed(slot_type: String, index: int) -> void:
	if active_inventory == null:
		return
	if held_stack == null:
		pick_up_stack(active_inventory, slot_type, index, false)
	else:
		place_held_stack(active_inventory, slot_type, index, false)


func _on_slot_gui_input(event: InputEvent, slot_type: String, index: int) -> void:
	if not event is InputEventMouseButton:
		return
	if event.button_index != MOUSE_BUTTON_RIGHT or not event.pressed:
		return
	if active_inventory == null:
		return
	if held_stack == null:
		pick_up_stack(active_inventory, slot_type, index, true)
	else:
		place_held_stack(active_inventory, slot_type, index, true)
	get_viewport().set_input_as_handled()


func _on_equipment_pressed(slot_name: String) -> void:
	print("Equipment slot clicked: ", slot_name)


func _unhandled_key_input(event: InputEvent) -> void:
	if not event is InputEventKey or not event.pressed or event.echo:
		return
	if event.keycode == KEY_E:
		toggle_inventory()
		get_viewport().set_input_as_handled()
	elif event.keycode == KEY_TAB and visible:
		switch_viewed_character()
		get_viewport().set_input_as_handled()
	elif event.keycode == KEY_ESCAPE and visible:
		return_held_stack()
		get_viewport().set_input_as_handled()


func toggle_inventory() -> void:
	if visible:
		return_held_stack()
		if held_stack != null:
			return
		hide()
		get_tree().paused = false
	else:
		set_viewed_character(0)
		show()
		get_tree().paused = true
