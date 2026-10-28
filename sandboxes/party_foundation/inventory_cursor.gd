extends RefCounted

# A real held stack: it is absent from storage until placed or safely returned.
var stack: ItemStack
var home_inventory: RefCounted
var home_section: String = ""
var home_index: int = -1
var message: String = ""

func take(inventory: RefCounted, section: String, index: int, half: bool = false) -> bool:
	if stack != null or not inventory.valid_slot(section,index):
		return false
	var resolved: Dictionary = inventory.resolve_slot(section,index)
	section = resolved.section
	index = resolved.index
	var source: ItemStack = inventory.get_stack(section,index)
	if source == null:
		return false
	home_inventory = inventory
	home_section = section
	home_index = index
	if half and source.quantity > 1:
		var amount: int = ceili(source.quantity/2.0)
		stack = ItemStack.new(source.item,amount)
		source.quantity -= amount
	else:
		stack = source
		inventory.set_stack(section,index,null)
	message = ""
	return true

func place(inventory: RefCounted, section: String, index: int, one: bool = false) -> bool:
	if stack == null or not inventory.valid_slot(section,index):
		return false
	if not inventory.can_accept(stack,section):
		message = "This item cannot go in that equipment slot."
		return false
	if inventory != home_inventory and not stack.item.transferable:
		message = "This personal item must stay with its owner."
		return false
	var destination: ItemStack = inventory.get_stack(section,index)
	if destination == null:
		var amount: int = 1 if one else stack.quantity
		inventory.set_stack(section,index,ItemStack.new(stack.item,amount))
		stack.quantity -= amount
		if stack.quantity == 0:
			clear()
	elif destination.can_stack_with(stack):
		var amount: int = mini(destination.available_space(),1 if one else stack.quantity)
		if amount <= 0:
			message = "That stack is full."
			return false
		destination.quantity += amount
		stack.quantity -= amount
		if stack.quantity == 0:
			clear()
	elif not one:
		if inventory != home_inventory and not destination.item.transferable:
			message = "That personal item cannot be exchanged."
			return false
		inventory.set_stack(section,index,stack)
		stack = destination
		home_inventory = inventory
		home_section = section
		home_index = index
	else:
		message = "Place one into an empty or matching slot."
		return false
	message = ""
	return true

func clear() -> void:
	stack = null
	home_inventory = null
	home_section = ""
	home_index = -1

func restore_into(section: String, index: int) -> void:
	if stack == null or not home_inventory.can_accept(stack,section):
		return
	var existing: ItemStack = home_inventory.get_stack(section,index)
	if existing == null:
		home_inventory.set_stack(section,index,stack)
		clear()
	elif existing.can_stack_with(stack):
		var amount: int = mini(existing.available_space(),stack.quantity)
		existing.quantity += amount
		stack.quantity -= amount
		if stack.quantity == 0:
			clear()

func return_home() -> bool:
	if stack == null:
		return true
	if home_inventory == null:
		return false
	restore_into(home_section,home_index)
	for section in ["on_person","backpack","quick"]:
		if stack == null:
			break
		var size: int = home_inventory.slots(section).size()
		for i in range(size):
			if stack == null:
				break
			restore_into(section,i)
	if stack != null:
		message = "No space to return held item. Place it before closing."
		return false
	return true
