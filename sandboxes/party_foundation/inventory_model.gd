extends RefCounted

# Quantities mutate here, never in the UI. Definitions remain shared Resources.
var owner_id: StringName
var on_person: Array = []
var backpack: Array = []
var equipped_weapon: ItemStack = null
var selected_quick_slot: int = -1
var weapon: ItemStack:
	get:
		if quick_weapon_selected():
			return quick_slots[selected_quick_slot]
		return equipped_weapon
	set(value):
		if quick_weapon_selected():
			quick_slots[selected_quick_slot] = null
		selected_quick_slot = -1
		equipped_weapon = value
var quick_slots: Array = []
var backpack_visible_slots: int = 12

func ensure_backpack_space() -> void:
	var last_occupied: int = -1
	for i in range(backpack.size()):
		if backpack[i] != null:
			last_occupied = i
	# Keep one available cell after the last occupied one; grow in rows of four.
	var needed: int = maxi(12,ceili((last_occupied+2)/4.0)*4)
	backpack_visible_slots = maxi(backpack_visible_slots,needed)
	if backpack.size() < backpack_visible_slots:
		backpack.resize(backpack_visible_slots)

func _init(id: StringName = &"") -> void:
	owner_id = id
	on_person.resize(8)
	quick_slots.resize(6)
	backpack.resize(24)

func slots(section: String) -> Array:
	if section == "quick":
		return quick_slots
	return on_person if section == "on_person" else backpack

func quick_weapon_selected() -> bool:
	return selected_quick_slot >= 0 and selected_quick_slot < quick_slots.size() and quick_slots[selected_quick_slot] != null and can_accept(quick_slots[selected_quick_slot],"weapon")

func select_quick_slot(index: int) -> bool:
	if index < 0 or index >= quick_slots.size():
		return false
	var incoming: ItemStack = quick_slots[index]
	if incoming != null and can_accept(incoming,"weapon") and equipped_weapon != null:
		var stored: bool = false
		for container in [on_person,backpack]:
			for i in range(container.size()):
				if container[i] == null:
					container[i] = equipped_weapon
					stored = true
					break
			if stored:
				break
		if not stored:
			backpack.append(equipped_weapon)
		ensure_backpack_space()
		equipped_weapon = null
	selected_quick_slot = index
	return true

func resolve_slot(section: String, index: int) -> Dictionary:
	if section == "weapon" and quick_weapon_selected():
		return {"section":"quick","index":selected_quick_slot}
	return {"section":section,"index":index}

func get_stack(section: String, index: int) -> ItemStack:
	if section == "weapon":
		return weapon if index == 0 else null
	var container: Array = slots(section)
	return container[index] if index >= 0 and index < container.size() else null

func valid_slot(section: String, index: int) -> bool:
	if section == "weapon":
		return index == 0
	return section in ["on_person","backpack","quick"] and index >= 0 and index < slots(section).size()

func set_stack(section: String, index: int, stack: ItemStack) -> void:
	if section == "weapon":
		weapon = stack
	else:
		slots(section)[index] = stack
		if section == "backpack":
			ensure_backpack_space()
		elif section == "quick" and stack != null and can_accept(stack,"weapon"):
			select_quick_slot(index)

func can_accept(stack: ItemStack, section: String) -> bool:
	if stack == null or stack.item == null:
		return false
	if section != "weapon":
		return true
	if stack.item.category != ItemData.ItemCategory.WEAPON or stack.quantity != 1:
		return false
	if stack.item.usable_by.is_empty():
		return true
	for character in stack.item.usable_by:
		if character.to_lower() == String(owner_id):
			return true
	return false

func equip_weapon(section: String, index: int) -> bool:
	var source_slots: Array = slots(section)
	if index < 0 or index >= source_slots.size():
		return false
	var stack: ItemStack = source_slots[index]
	if stack == null or stack.item.category != ItemData.ItemCategory.WEAPON or stack.quantity != 1:
		return false
	if not stack.item.usable_by.is_empty():
		var permitted: bool = false
		for character in stack.item.usable_by:
			if character.to_lower() == String(owner_id):
				permitted = true
		if not permitted:
			return false
	var previous: ItemStack = weapon
	if quick_weapon_selected():
		quick_slots[selected_quick_slot] = null
		selected_quick_slot = -1
	source_slots[index] = previous
	weapon = stack
	return true

func unequip_weapon() -> bool:
	var current: ItemStack = weapon
	if current == null:
		return false
	for container in [on_person,backpack]:
		for i in range(container.size()):
			if container[i] == null:
				if quick_weapon_selected():
					quick_slots[selected_quick_slot] = null
				selected_quick_slot = -1
				equipped_weapon = null
				container[i] = current
				return true
	return false

func transfer_to(source_section: String, source_index: int, destination: RefCounted,
		destination_section: String, destination_index: int, amount: int) -> bool:
	var source_slots: Array = slots(source_section)
	var destination_slots: Array = destination.slots(destination_section)
	if source_index < 0 or source_index >= source_slots.size():
		return false
	if destination_index < 0 or destination_index >= destination_slots.size():
		return false
	if self == destination and source_section == destination_section and source_index == destination_index:
		return false
	var source: ItemStack = source_slots[source_index]
	var target: ItemStack = destination_slots[destination_index]
	if source == null or amount <= 0:
		return false
	if self != destination and not source.item.transferable:
		return false
	amount = mini(amount, source.quantity)
	if target == null:
		amount = mini(amount, source.item.max_stack)
		destination_slots[destination_index] = ItemStack.new(source.item, amount)
	elif target.can_stack_with(source):
		amount = mini(amount, target.available_space())
		if amount == 0:
			return false
		target.quantity += amount
	else:
		# A full-stack swap must validate both directions before either mutation.
		if amount != source.quantity:
			return false
		if self != destination and not target.item.transferable:
			return false
		source_slots[source_index] = target
		destination_slots[destination_index] = source
		if destination_section == "backpack":
			destination.ensure_backpack_space()
		return true
	source.quantity -= amount
	if source.quantity == 0:
		source_slots[source_index] = null
	if destination_section == "backpack":
		destination.ensure_backpack_space()
	return true
