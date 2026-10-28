extends SceneTree
var checks: int = 0
var failures: int = 0
func _initialize() -> void:
	call_deferred("run")
func check(value: bool, description: String) -> void:
	checks += 1
	if not value:
		failures += 1
		push_error("FAIL: "+description)
	else:
		print("PASS: "+description)
func frames(count: int) -> void:
	for i in range(count):
		await physics_frame
func run() -> void:
	var scene = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	await frames(3)
	# Isolate interaction checks at fixed coordinates; layout routes are tested separately.
	scene.earth_prop.position = Vector2(250,350)
	scene.air_prop.position = Vector2(100,370)
	scene.brazier.position = Vector2(250,405)
	await frames(2)
	var manager = scene.manager
	var katara = manager.roster[0]
	var sokka = manager.roster[1]
	var aang = manager.roster[2]
	var toph = manager.roster[3]
	var zuko = manager.roster[4]
	# Separate test actors from the prop area so collision guards are meaningful.
	for i in range(manager.roster.size()):
		manager.roster[i].position = Vector2(50,120+i*20)
	manager.active_group().reset_route()
	check(sokka.bending == null,"Sokka remains a nonbender")
	for actor in [aang,toph,zuko]:
		check(actor.bending != null and actor.bending.definition.allowed_characters == [actor.character_id],actor.name+" owns an element-specific technique resource")
		check(not actor.bending.select_technique(sokka),actor.name+" technique rejects another character")
		actor.bending.selected = false
		check(not actor.bending.click_at(actor,scene.earth_prop.position),actor.name+" must select bending before using it")
	toph.position = Vector2(180,350)
	check(toph.bending.select_technique(toph),"Toph selects earth bending")
	check(not toph.bending.click_at(toph,scene.air_prop.position),"Earth rejects incompatible material")
	check(toph.bending.click_at(toph,scene.earth_prop.position),"Earth cast begins toward marked stone")
	check(not scene.earth_prop.raised,"Earth reaction waits for effect arrival")
	check(not toph.bending.click_at(toph,scene.earth_prop.position),"A cast cannot be stacked while in flight")
	await frames(40)
	check(scene.earth_prop.raised and scene.earth_prop.reactions_applied==1,"Toph raises stone exactly once")
	check(not scene.earth_prop.collision_body.get_child(0).disabled,"Raised stone has physical collision")
	check(scene.navigation.is_point_solid(Vector2i(15,21)),"Raised stone updates navigation")
	check(toph.bending.click_at(toph,scene.earth_prop.position),"Raised stone can be targeted to lower it")
	await frames(40)
	check(not scene.earth_prop.raised and scene.earth_prop.collision_body.get_child(0).disabled,"Lowering removes stone collision")
	check(not scene.navigation.is_point_solid(Vector2i(15,21)),"Lowering restores navigation")
	toph.position = scene.earth_prop.position
	check(not scene.earth_prop.receive_interaction(toph.bending.payload()),"Stone cannot rise underneath a party member")
	toph.position = Vector2(180,350)
	check(toph.bending.click_at(toph,scene.earth_prop.position),"Earth animation can be started for pause test")
	await frames(3)
	var saved: Vector2 = toph.bending.effect_position
	scene.ui.open_modal("inventory")
	scene.ui.show_inventory()
	await create_timer(0.08,true,false,true).timeout
	check(toph.bending.effect_position==saved and not scene.earth_prop.raised,"Inventory pauses bending animation and its pending reaction")
	check(not toph.bending.click_at(toph,scene.earth_prop.position),"Paused bending rejects world commands")
	scene.ui.close_modal()
	await frames(40)
	check(scene.earth_prop.raised,"Closing inventory resumes the pending cast")
	toph.bending.cancel()
	check(not toph.bending.selected and not toph.bending.casting,"Right-click cancellation clears selection and pending effects")
	toph.position = Vector2(400,350)
	toph.bending.select_technique(toph)
	check(not toph.bending.click_at(toph,scene.earth_prop.position),"Bending rejects an out-of-range target")
	# Across the fixed ice wall, inside range.
	var old_stone: Vector2 = scene.earth_prop.position
	scene.earth_prop.position = Vector2(350,350)
	toph.position = Vector2(280,350)
	check(not toph.bending.click_at(toph,scene.earth_prop.position),"Earth cannot be cast through a wall")
	scene.earth_prop.position = old_stone
	toph.position = Vector2(180,350)
	# Air push is directional and updates physical/nav position.
	aang.position = Vector2(160,370)
	aang.bending.select_technique(aang)
	var before: Vector2 = scene.air_prop.position
	check(aang.bending.click_at(aang,scene.air_prop.position),"Aang casts air at the lightweight block")
	await frames(40)
	check(scene.air_prop.position.distance_to(before)>31 and scene.air_prop.position.x<before.x,"Air pushes the block away from Aang")
	check(scene.air_prop.reactions_applied==1,"Air reaction happens once per cast")
	var air_position: Vector2 = scene.air_prop.position
	aang.bending.cast_direction=Vector2.LEFT
	sokka.position=air_position+Vector2(-25,0)
	check(not scene.air_prop.receive_interaction(aang.bending.payload()) and scene.air_prop.position==air_position,"Air cannot push a block through a party member")
	sokka.position=Vector2(50,140)
	scene.air_prop.position=Vector2(280,350)
	aang.bending.cast_direction=Vector2.RIGHT
	check(not scene.air_prop.receive_interaction(aang.bending.payload()),"Air block cannot move through a solid wall")
	scene.air_prop.position=air_position
	# Fire and water act on the same brazier through different reaction profiles.
	zuko.position=Vector2(180,405)
	zuko.bending.select_technique(zuko)
	check(not zuko.bending.click_at(zuko,scene.reservoir.position),"Fire does not fill a reservoir")
	check(zuko.bending.click_at(zuko,scene.brazier.position),"Zuko ignites a compatible unlit brazier")
	check(not scene.brazier.burning,"Ignition waits for visible fire delivery")
	await frames(40)
	check(scene.brazier.burning and scene.brazier.reactions_applied==1,"Fire delivery ignites brazier exactly once")
	check(zuko.bending.click_at(zuko,scene.brazier.position),"Zuko can target a lit brazier to extinguish it")
	await frames(40)
	check(not scene.brazier.burning,"Zuko extinguishes a lit brazier")
	zuko.bending.click_at(zuko,scene.brazier.position)
	await frames(40)
	check(scene.brazier.receive_interaction(scene.water.payload()) and not scene.brazier.burning,"Katara's water reaction extinguishes the same brazier")
	check(zuko.bending.click_at(zuko,scene.brazier.position),"Extinguished brazier can be relit")
	zuko.bending.cancel()
	await frames(40)
	check(not scene.brazier.burning,"Cancelling fire before arrival prevents ignition")
	# Character switching does not transfer ownership or selection.
	while manager.active_group().members[0] != aang:
		manager.rotate_leader()
	scene.ui.activate_quick_slot(0)
	check(aang.bending.selected,"Quickslot 1 selects the active character's air technique")
	manager.rotate_leader()
	check(aang.bending.owner_actor==aang and toph.bending.owner_actor==toph,"Party rotation preserves individual bending ownership")
	print("ELEMENT TESTS: %d checks, %d failures" % [checks,failures])
	quit(1 if failures>0 else 0)
