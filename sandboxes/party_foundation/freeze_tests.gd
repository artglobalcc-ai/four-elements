extends SceneTree
var checks: int = 0
var failures: int = 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, description: String) -> void:
	checks += 1
	if ok:
		print("PASS: "+description)
	else:
		failures += 1
		push_error("FAIL: "+description)
func frames(count: int) -> void:
	for i in range(count):
		await physics_frame
func run() -> void:
	var scene=load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene=scene
	await frames(3)
	var manager=scene.manager
	var katara=manager.roster[0]
	var sokka=manager.roster[1]
	var toph=manager.roster[3]
	check(scene.water.selected and katara.inventory.selected_quick_slot==0,"Katara starts with move 1 active without spawning water")
	for actor in [manager.roster[2],toph,manager.roster[4]]:
		check(actor.bending.selected and actor.inventory.selected_quick_slot==0,actor.name+" starts with move 1 active")
	manager.set_physics_process(false)
	for i in range(manager.roster.size()):
		manager.roster[i].position=Vector2(40,120+i*24)
	katara.position=Vector2(140,350)
	scene.source.position=Vector2(160,350)
	scene.water.aim_override=Vector2(160,350)
	scene.water.click_at(katara,scene.source.position)
	check(scene.water.carrying,"Default move collects water with no move-selection step")
	var crate=load("res://sandboxes/party_foundation/hit_target.gd").new()
	crate.position=Vector2(220,350)
	scene.add_child(crate)
	await frames(2)
	check(scene.water.click_at(katara,crate.position) and scene.water.shot.casting and not scene.water.carrying,"Same move shoots collected water without changing quickslots")
	await frames(40)
	check(crate.broken,"Combined water move hits and breaks a fragile crate")
	scene.water.click_at(katara,scene.source.position)
	scene.vessel.position=Vector2(190,350)
	scene.water.click_at(katara,scene.vessel.position)
	check(scene.water.releasing and not scene.water.shot.casting,"A compatible vessel takes placement priority over shooting")
	await frames(80)
	check(scene.vessel.filled and not scene.water.carrying,"Combined move deposits water into the selected vessel")
	check(scene.water.click_at(katara,scene.vessel.position) and scene.water.carrying,"Combined move can pick deposited water back up")
	scene.water.cancel()
	# Freeze a marked crossing and verify both walking collision and navigation.
	var ice=scene.ice_platform
	katara.position=ice.position+Vector2(0,65)
	var freeze=scene.bending_modes[&"katara"][1]
	scene.ui.activate_quick_slot(1)
	check(scene.current_bending(katara)==freeze and freeze.definition.technique_id==&"freeze","Katara's second move is Freeze / Thaw")
	check(not freeze.select_technique(toph),"Toph cannot select Katara's Freeze")
	check(not ice.can_receive(toph.bending.payload()),"Other elements cannot toggle this water platform")
	var cell:=Vector2i(floori(ice.position.x/16),floori(ice.position.y/16))
	scene.refresh_navigation()
	check(scene.navigation.is_point_solid(cell),"Liquid crossing blocks navigation")
	check(freeze.click_at(katara,ice.position),"Freeze targets the crossing within bending range")
	await frames(40)
	check(ice.frozen and ice.collision_body.get_child(0).disabled,"Freeze makes the crossing walkable")
	check(not scene.navigation.is_point_solid(cell),"Frozen crossing updates navigation")
	# Leave an inactive group on the platform; occupancy must include that group.
	manager.split_selected([&"katara"])
	sokka.position=ice.position
	check(freeze.click_at(katara,ice.position),"Thaw can be requested while an inactive companion stands on ice")
	await frames(40)
	check(ice.frozen and ice.collision_body.get_child(0).disabled,"Thaw refuses to remove ice under an inactive party member")
	check(manager.message.contains("move everyone off"),"Blocked thaw explains that the platform is occupied")
	sokka.position=ice.position+Vector2(0,16)
	check(not ice.receive_interaction(freeze.payload()) and ice.frozen,"An actor overlapping the platform edge also prevents thaw")
	sokka.position=Vector2(40,144)
	katara.position=ice.position
	check(not ice.receive_interaction(freeze.payload()) and ice.frozen,"Active leader standing on ice prevents thaw")
	katara.position=ice.position+Vector2(0,65)
	check(freeze.click_at(katara,ice.position),"Thaw is permitted after all characters leave the platform")
	await frames(40)
	check(not ice.frozen and not ice.collision_body.get_child(0).disabled,"Thaw restores liquid collision")
	check(scene.navigation.is_point_solid(cell),"Thaw restores navigation blocking")
	freeze.click_at(katara,ice.position)
	await frames(3)
	var saved: Vector2=freeze.effect_position
	scene.ui.open_modal("inventory")
	scene.ui.show_inventory()
	await create_timer(0.08,true,false,true).timeout
	check(not ice.frozen and saved==freeze.effect_position,"Inventory pauses Freeze before the state change")
	scene.ui.close_modal()
	await frames(40)
	check(ice.frozen,"Freeze resumes after closing inventory")
	print("FREEZE/COMBINED WATER TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
