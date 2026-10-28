extends SceneTree

var checks: int = 0
var failures: int = 0

func _initialize() -> void:
	call_deferred("run")

func check(value: bool, description: String) -> void:
	checks += 1
	if value:
		print("PASS: ",description)
	else:
		failures += 1
		push_error("FAIL: " + description)

func frames(count: int) -> void:
	for i in range(count):
		await physics_frame

func run() -> void:
	var world = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(world)
	current_scene = world
	await frames(3)
	var water = world.water
	var manager = world.manager
	var katara = manager.roster[0]
	var sokka = manager.roster[1]
	var aang = manager.roster[2]
	check(water.selected and not water.carrying,"Water is selected automatically without spawning material")
	water.selected = false
	check(not water.click_at(katara,world.source.position),"Technique must be selected before collecting")
	check(not water.select_technique(sokka),"Nonbender cannot select Katara's technique")
	check(water.select_technique(katara),"Katara selects Water Manipulation")
	katara.position = Vector2(500,350)
	water.click_at(katara,world.source.position)
	check(not water.carrying,"Out-of-range source cannot be collected remotely")
	katara.position = Vector2(160,224)
	water.aim_override = Vector2(165,205)
	water.click_at(katara,world.source.position)
	check(water.carrying and katara.concentration_remaining == 45,"Collecting water begins 45-second concentration")
	var start: Vector2 = water.water_position
	await frames(2)
	check(water.water_position.distance_to(start) > 0 and water.water_position.distance_to(start) < 10,"Blue sphere moves gradually rather than teleporting to aim")
	var remaining: float = katara.concentration_remaining
	water.click_at(katara,world.source.position)
	check(water.carrying and katara.concentration_remaining == remaining,"Repeated source clicks do not refill active concentration")
	Input.action_press("move_left")
	await frames(20)
	Input.action_release("move_left")
	check(katara.position.x < 150 and water.carrying,"Katara can walk while sustaining water")
	# Aim into clear ground; the east boundary lies inside the test crate's footprint.
	water.aim_override = katara.position + Vector2(0,1000)
	await frames(70)
	check(water.carrying and water.water_position.distance_to(katara.position) <= water.definition.control_range + 0.01,"Mouse beyond range keeps controlled water inside the radius")
	check(water.water_position.y > katara.position.y + 40,"Water still approaches an unobstructed range boundary")
	katara.position = Vector2(165,340)
	water.water_position = katara.position + Vector2(0,30)
	var all_angles: bool = true
	for i in range(8):
		var direction := Vector2.from_angle(i*TAU/8)
		water.aim_override = katara.position + direction * 1000
		await frames(70)
		var expected: Vector2 = katara.position + direction * water.definition.control_range
		all_angles = all_angles and water.carrying and water.water_position.distance_to(expected) < 4.0
	check(all_angles,"Beyond-range cursor steers water all 360 degrees around Katara")
	water.aim_override = katara.position + Vector2(0,1000)
	await frames(55)
	remaining = katara.concentration_remaining
	Input.action_press("move_up")
	await frames(30)
	Input.action_release("move_up")
	check(water.carrying and water.within_range(water.water_position) and katara.concentration_remaining < remaining,"Walking while water is at the range boundary retains control and concentration")
	var old_clock: float = world.world_clock
	var old_water: Vector2 = water.water_position
	var old_animation: float = water.animation_time
	remaining = katara.concentration_remaining
	world.ui.open_modal("inventory")
	world.ui.show_inventory()
	await create_timer(0.15,true,false,true).timeout
	check(katara.concentration_remaining == remaining and world.world_clock == old_clock,"Inventory pauses concentration and entire world")
	check(water.water_position == old_water and water.animation_time == old_animation,"Inventory freezes water motion and blue animation")
	water.click_at(katara,world.fire.position)
	check(not water.releasing,"Paused world ignores water release commands")
	world.ui.close_modal()
	manager.rotate_leader()
	check(water.carrying and katara.concentration_remaining == remaining,"Tab retains Katara's water and remaining concentration")
	await frames(8)
	check(water.carrying and katara.concentration_remaining < remaining,"Inactive character continues concentrating")
	while manager.active_group().members[0] != katara:
		manager.rotate_leader()
	check(manager.split_selected([&"katara",&"aang"]),"Party can split while Katara sustains water")
	manager.select_next_group()
	remaining = katara.concentration_remaining
	await frames(10)
	check(water.carrying and katara.concentration_remaining < remaining,"Water survives switching to a different group")
	manager.select_next_group()
	water.cancel("Test reset")
	check(not water.carrying and katara.concentration_remaining == 0,"Right-click cancellation drops water and clears concentration")
	check(not water.splashes.is_empty(),"Dropping creates a short blue splash")
	# Move only test actors. Recollect renewable source and deliver to the reservoir.
	katara.position = Vector2(170,175)
	water.aim_override = Vector2(185,170)
	water.click_at(katara,world.source.position)
	await frames(45)
	water.click_at(katara,world.reservoir.position)
	check(water.releasing,"Compatible reservoir starts a moving release")
	await frames(90)
	check(world.reservoir.filled and not world.water_gate_closed,"Deposited water fills reservoir and opens its gate")
	check(not water.carrying and katara.concentration_remaining == 0,"Successful reaction consumes held water exactly once")
	check(world.reservoir.reactions_applied == 1,"Reservoir reaction is not repeated each animation frame")
	await frames(3)
	check(world.find_route(Vector2(120,120),Vector2(120,40)).size() > 0,"Gate opening updates navigation into the north pocket")
	check(not world.reservoir.receive_interaction(water.payload()),"Filled reservoir refuses duplicate activation")
	water.click_at(katara,world.reservoir.position)
	check(water.carrying and world.reservoir.water_amount==0 and not world.reservoir.filled,"Stored water can be picked back up from the reservoir")
	check(world.water_gate_closed,"Removing reservoir water closes its gate again")
	await frames(3)
	check(world.find_route(Vector2(120,120),Vector2(120,40)).is_empty(),"Draining reservoir closes the navigation passage")
	check(not world.water_gate_body.get_child(0).disabled,"Draining reservoir restores gate collision")
	katara.position=Vector2(165,230)
	water.aim_override=Vector2(165,235)
	await frames(65)
	water.click_at(katara,world.vessel.position)
	await frames(90)
	check(world.vessel.filled and world.vessel.water_amount==1 and not water.carrying,"Water can be transferred from reservoir into another vessel")
	water.click_at(katara,world.vessel.position)
	check(water.carrying and world.vessel.water_amount==0,"Picking water from vessel removes its stored quantity")
	# Same technique, a different object reaction.
	katara.position = Vector2(165,230)
	water.aim_override = Vector2(170,230)
	if not water.carrying:
		water.click_at(katara,world.source.position)
	await frames(50)
	water.click_at(katara,world.fire.position)
	await frames(100)
	check(not world.fire.burning and world.fire.reactions_applied == 1,"The same technique extinguishes a separate fire")
	check(not water.carrying,"Extinguishing consumes the water")
	check(not world.fire.receive_interaction({"utilities":[&"modify_material_state"],"properties":[&"stone"],"strength":10}),"Reaction profile checks material property, not just utility")
	# Invalid releases retain water, then concentration expiry drops it.
	water.click_at(katara,world.source.position)
	check(water.carrying,"Renewable pool permits another attempt after release")
	water.click_at(katara,world.fire.position)
	check(water.carrying and not water.releasing,"An already extinguished fire does not consume held water")
	var saved_source: Vector2 = world.source.position
	world.source.position = Vector2(350,224)
	katara.position = Vector2(270,224)
	water.cancel("Test reset")
	world.toggle_gate()
	await frames(3)
	water.click_at(katara,world.source.position)
	check(not water.carrying,"Closed wall blocks collecting a source even inside radial range")
	world.toggle_gate()
	await frames(3)
	water.click_at(katara,world.source.position)
	check(water.carrying,"Opening the passage permits collecting the source")
	water.aim_override = Vector2(270,240)
	await frames(55)
	world.toggle_gate()
	await frames(3)
	water.aim_override = Vector2(350,224)
	var x_before: float = water.water_position.x
	await frames(45)
	check(water.carrying and water.water_position.x < 304 and x_before < 304,"Held water does not pass through a newly closed gate")
	world.source.position = saved_source
	katara.concentration_remaining = 0.02
	await frames(5)
	check(not water.carrying and katara.concentration_remaining == 0,"Concentration expiry drops water automatically")
	check(world.water_gate_closed and not world.fire.burning,"Drained reservoir and extinguished fire retain their state within the session")
	# Verify an interrupted release cannot activate a target from outside control range.
	world.fire.burning = true
	water.cancel()
	katara.position = Vector2(165,230)
	water.click_at(katara,world.source.position)
	water.click_at(katara,world.fire.position)
	katara.position = Vector2(40,350)
	await frames(5)
	check(world.fire.burning,"Moving outside control range interrupts delivery before reaction")
	print("WATER TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures == 0 else 1)
