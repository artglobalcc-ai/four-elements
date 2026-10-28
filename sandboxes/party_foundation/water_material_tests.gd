extends SceneTree
var checks: int = 0
var failures: int = 0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, description: String) -> void:
	checks+=1
	if ok:
		print("PASS: "+description)
	else:
		failures+=1
		push_error("FAIL: "+description)
func frames(count: int) -> void:
	for i in range(count):
		await physics_frame
func run() -> void:
	var scene=load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene=scene
	await frames(3)
	scene.manager.set_physics_process(false)
	for i in range(scene.manager.roster.size()):
		scene.manager.roster[i].position=Vector2(40,120+i*24)
	var katara=scene.manager.roster[0]
	var freeze=scene.bending_modes[&"katara"][1]
	var payload: Dictionary=freeze.payload()
	var water=scene.water
	for body in [scene.source,scene.puddle]:
		check(body.is_available_source(),body.name+" is bendable by default")
		var amount: int=body.water_amount
		check(body.receive_interaction(payload) and body.frozen,body.name+" freezes using Katara's second move")
		check(not body.is_available_source() and not body.take_water(),body.name+" cannot supply frozen water")
		check(body.water_amount==amount,body.name+" preserves quantity while frozen")
		check(body.receive_interaction(payload) and not body.frozen,body.name+" can thaw again")
	var puddle=scene.puddle
	check(puddle.take_water() and puddle.water_amount==1,"Finite puddle loses one unit per draw")
	check(puddle.take_water() and puddle.water_amount==0,"Finite puddle can be exhausted")
	check(not puddle.take_water() and not puddle.can_receive(payload),"An empty puddle cannot supply water or freeze")
	check(puddle.receive_interaction(water.payload()) and puddle.water_amount==1,"Deposited water refills a depleted puddle")
	check(puddle.receive_interaction(water.payload()) and puddle.water_amount==2,"Puddle accepts its configured capacity")
	check(not puddle.receive_interaction(water.payload()) and puddle.water_amount==2,"A full puddle cannot duplicate water through overfill")
	for body in [scene.vessel,scene.reservoir]:
		check(not body.can_receive(payload),body.name+" cannot freeze while empty")
		check(body.receive_interaction(water.payload()),body.name+" accepts collected water")
		check(body.receive_interaction(payload) and body.frozen,body.name+" stored water is freezable")
		check(not body.take_water() and body.water_amount==1,body.name+" frozen contents cannot be collected")
		check(body.receive_interaction(payload) and body.take_water(),body.name+" thawed water is recoverable")
	check(scene.water_gate_closed,"Draining thawed reservoir closes its gate")
	# The new state is per instance, not a shared resource among all water objects.
	scene.source.receive_interaction(payload)
	check(scene.source.frozen and not puddle.frozen,"Freezing one water body does not freeze another")
	# Any party member overlapping a frozen pool surface prevents thaw.
	var sokka=scene.manager.roster[1]
	sokka.position=scene.source.position
	check(not scene.source.receive_interaction(payload) and scene.source.frozen,"A companion standing on a frozen pool prevents thaw")
	sokka.position=Vector2(40,144)
	check(scene.source.receive_interaction(payload),"Pool can thaw once everyone moves clear")
	# Material rules explicitly opt out inaccessible/nonbendable water.
	puddle.water_material.bending_allowed=false
	check(not puddle.is_available_source() and not puddle.take_water(),"Explicit nonbendable water cannot be drawn")
	check(not puddle.can_receive(payload),"Explicit nonbendable water also rejects freezing")
	puddle.water_material.bending_allowed=true
	check(not puddle.can_receive(scene.manager.roster[3].bending.payload()),"Earth manipulation cannot freeze water")
	check(not scene.fire.can_receive(payload),"Freeze cannot affect a fire just because it is an environment target")
	# Actual controller collection from a liquid crossing uses a reachable shoreline.
	var crossing=scene.ice_platform
	katara.position=crossing.position+Vector2(0,70)
	water.aim_override=katara.position+Vector2(10,-5)
	check(crossing.is_available_source(),"The liquid crossing is a normal bendable water body")
	water.click_at(katara,crossing.position)
	check(water.carrying,"Katara can collect crossing water without targeting its blocked center")
	check(not crossing.footprint.has_point(crossing.to_local(water.water_position)),"Collected crossing water appears at the accessible shoreline")
	water.cancel()
	check(crossing.receive_interaction(payload),"Crossing still supports freezing after drawing water")
	check(not crossing.is_available_source() and not crossing.take_water(),"Frozen crossing cannot be collected until thawed")
	check(crossing.receive_interaction(payload) and crossing.is_available_source(),"Thawing restores crossing water availability")
	print("WATER MATERIAL TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
