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
	var sokka=world.manager.roster[1]
	ui.open_modal("inventory")
	ui.viewed_index=1
	ui.show_inventory()
	var original_art: Texture2D=ui.inventory_background.texture
	ui.storage_buttons.Pack.pressed.emit()
	await process_frame
	check(ui.storage_grid.columns==4 and ui.storage_grid.get_child_count()==12,"Backpack starts with three rows of four cells")
	check(ui.inventory_background.texture==original_art,"Original artwork is retained behind scrolling inset")
	check(ui.storage_scroll.position==Vector2(132,51) and ui.storage_scroll.size==Vector2(109,53),"Only the right-panel slot interior scrolls")
	var quick_position: Vector2=ui.slot_buttons["quick:0"].get_global_rect().position
	var weapon_position: Vector2=ui.weapon_button.get_global_rect().position
	var fish: ItemData=load("res://Items/fish1.tres")
	for i in range(28):
		sokka.inventory.set_stack("backpack",i,ItemStack.new(fish,1))
	ui.show_inventory()
	await process_frame
	await process_frame
	check(sokka.inventory.backpack_visible_slots>=32,"Filling storage grows available rows instead of using fixed pages")
	check(ui.storage_grid.get_child_count()>=32 and ui.storage_scroll.get_v_scroll_bar().max_value>ui.storage_scroll.size.y,"Expanded storage has a scrollable range")
	ui.storage_scroll.scroll_vertical=30
	await process_frame
	check(ui.storage_scroll.scroll_vertical>0,"Expanded backpack can scroll down")
	check(ui.slot_buttons["quick:0"].get_global_rect().position==quick_position and ui.weapon_button.get_global_rect().position==weapon_position,"Quick slots and equipment remain stationary")
	ui.storage_buttons.Carry.pressed.emit()
	ui._slot_clicked(sokka,"on_person",0,false)
	ui._slot_clicked(sokka,"quick",0,false)
	check(sokka.inventory.quick_slots[0]!=null and sokka.inventory.weapon==sokka.inventory.quick_slots[0],"Club in quickslot 1 is the same item shown as equipped")
	check(sokka.inventory.on_person[0]==null and sokka.inventory.equipped_weapon==null,"Quick-equipped club is not duplicated into another storage slot")
	check(sokka.weapon_visual.visible,"Quickslot placement updates the carried weapon visual")
	ui.weapon_button.pressed.emit()
	check(sokka.inventory.quick_slots[0]==null and sokka.inventory.weapon==null and ui.cursor.stack!=null,"Picking up linked weapon empties quickslot and equipment together")
	ui._slot_clicked(sokka,"quick",0,false)
	ui.close_modal()
	world.manager.rotate_leader()
	ui._process(0)
	check(ui.hotbar_icons[0].texture==sokka.inventory.quick_slots[0].item.icon,"Exploration hotbar displays Sokka's club icon")
	ui.activate_quick_slot(1)
	check(sokka.inventory.weapon==null and sokka.inventory.quick_slots[0]!=null,"Selecting an empty quickslot unequips without deleting the club")
	var key:=InputEventKey.new()
	key.keycode=KEY_1
	key.physical_keycode=KEY_1
	key.pressed=true
	ui._input(key)
	check(sokka.inventory.weapon==sokka.inventory.quick_slots[0],"Key 1 re-equips the mapped club")
	ui.open_modal("inventory")
	ui.viewed_index=0
	ui.show_inventory()
	ui._slot_clicked(sokka,"weapon",0,false)
	ui.close_modal()
	check(sokka.inventory.quick_slots[0]!=null and sokka.inventory.weapon==sokka.inventory.quick_slots[0],"Closing restores a held linked weapon to its original quickslot")
	print("SCROLL/QUICK TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
