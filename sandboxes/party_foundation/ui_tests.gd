extends SceneTree

var checks: int = 0
var failures: int = 0

func _initialize() -> void:
	call_deferred("run")

func check(value: bool, description: String) -> void:
	checks+=1
	if value:
		print("PASS: ",description)
	else:
		failures+=1
		push_error("FAIL: "+description)

func run() -> void:
	var world=load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(world)
	current_scene=world
	await process_frame
	var ui=world.ui
	var katara=world.manager.roster[0]
	var sokka=world.manager.roster[1]
	ui.open_modal("inventory")
	ui.show_inventory()
	await process_frame
	check(paused and not ui.hud.visible,"Inventory pauses world")
	check(ui.inventory_background.texture==ui.SKINS[&"katara"],"Katara uses supplied water inventory artwork")
	check(ui.slot_buttons.size()==15,"Base panel has eight carried slots, six quick slots and one implemented weapon slot")
	check(ui.storage_buttons.has("Pack") and ui.storage_buttons.Pack.position.x>250,"Backpack is accessible with a right-side button")
	ui.storage_buttons.Pack.pressed.emit()
	check(ui.storage_view=="backpack" and ui.slot_buttons.has("backpack:0"),"Backpack button displays its actual storage slots")
	ui._slot_clicked(katara,"on_person",0,true)
	check(ui.cursor.stack.quantity==8 and katara.inventory.on_person[0].quantity==7,"Right-click pickup removes half stack from storage")
	check(ui.cursor_icon.visible and ui.cursor_icon.texture==ui.cursor.stack.item.icon,"Picked-up item is visibly attached to cursor overlay")
	ui.viewed_index=1
	ui.show_inventory()
	check(ui.inventory_background.texture==ui.SKINS[&"sokka"],"Sokka uses supplied nonbender inventory artwork")
	ui._slot_clicked(sokka,"backpack",0,true)
	check(sokka.inventory.backpack[0].quantity==1 and ui.cursor.stack.quantity==7,"Right-click places one item and retains remaining stack on cursor")
	ui._slot_clicked(sokka,"backpack",0,false)
	check(sokka.inventory.backpack[0].quantity==8 and ui.cursor.stack==null,"Left-click merges held remainder without duplication")
	ui.storage_buttons.Carry.pressed.emit()
	ui.slot_buttons["on_person:0"].pressed.emit()
	check(sokka.inventory.on_person[0]==null and ui.cursor.stack.item.item_id=="sokkas_club","Clicking club physically removes it from its old slot")
	ui.weapon_button.pressed.emit()
	check(sokka.inventory.weapon!=null and ui.cursor.stack==null and sokka.weapon_visual.visible,"Placing held club into weapon slot equips it directly")
	ui.weapon_button.pressed.emit()
	check(sokka.inventory.weapon==null and ui.cursor.stack!=null and not sokka.weapon_visual.visible,"Weapon slot allows mouse pickup to unequip")
	ui._slot_clicked(sokka,"quick",0,false)
	check(sokka.inventory.quick_slots[0]!=null and ui.cursor.stack==null,"Unequipped weapon can be placed into a quick slot")
	ui._slot_clicked(sokka,"quick",0,false)
	ui.viewed_index=0
	ui.show_inventory()
	ui._slot_clicked(katara,"weapon",0,false)
	check(ui.cursor.stack!=null and katara.inventory.weapon==null,"Sokka's club cannot equip on Katara and remains safely held")
	ui.close_modal()
	check(sokka.inventory.quick_slots[0]!=null and ui.cursor.stack==null and not paused,"Closing returns held personal item to its original owner")
	ui.open_modal("inventory")
	ui.viewed_index=0
	ui.show_inventory()
	ui._slot_clicked(katara,"on_person",0,false)
	ui._slot_clicked(katara,"weapon",0,false)
	check(katara.inventory.weapon==null and ui.cursor.stack.item.category==ItemData.ItemCategory.FOOD,"Food is rejected by weapon slot without losing the item")
	ui.close_modal()
	check(katara.inventory.on_person[0].quantity==7,"Closing safely returns picked-up food")
	for i in range(5):
		ui.open_modal("inventory")
		ui.viewed_index=i
		ui.show_inventory()
		var actor=world.manager.roster[i]
		check(ui.inventory_background.texture==ui.SKINS[actor.character_id],"Element skin matches "+str(actor.name))
		ui.close_modal()
	# Rejected cross-owner placement and failed-close fallback must keep the held stack.
	ui.open_modal("inventory")
	ui.viewed_index=1
	ui.show_inventory()
	ui._slot_clicked(sokka,"quick",0,false)
	ui.viewed_index=0
	ui.show_inventory()
	ui._slot_clicked(katara,"on_person",0,false)
	check(ui.cursor.stack!=null and katara.inventory.on_person[0].item.item_id=="fish1","Protected item cannot replace another character's stored fish")
	ui.close_modal()
	ui.open_modal("inventory")
	ui.viewed_index=0
	ui.show_inventory()
	ui._slot_clicked(katara,"on_person",0,false)
	for section in [katara.inventory.on_person,katara.inventory.backpack,katara.inventory.quick_slots]:
		for i in range(section.size()):
			section[i]=ItemStack.new(load("res://Items/fish1.tres"),20)
	ui.close_modal()
	check(paused and ui.modal=="inventory" and ui.cursor.stack!=null,"Full inventories keep UI open rather than deleting a held item")
	katara.inventory.on_person[0]=null
	ui.close_modal()
	check(not paused and ui.cursor.stack==null,"Close succeeds after space becomes available")
	print("UI TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
