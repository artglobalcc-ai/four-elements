extends SceneTree
var failures: int = 0
var checks: int = 0
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
	var scene = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	await frames(3)
	var manager = scene.manager
	for i in range(manager.roster.size()):
		manager.roster[i].position = Vector2(40,120+i*24)
	manager.active_group().reset_route()
	manager.set_physics_process(false)
	var rock = scene.earth_prop
	rock.position = Vector2(200,350)
	var aang = manager.roster[2]
	var toph = manager.roster[3]
	var zuko = manager.roster[4]
	aang.position=Vector2(140,350)
	aang.bending.select_technique(aang)
	check(aang.bending.click_at(aang,rock.position),"Air can target the same rock used by earth bending")
	await frames(40)
	check(rock.position.x>230 and not rock.raised,"Air pushes lowered rock without raising it")
	toph.position=Vector2(170,350)
	toph.bending.select_technique(toph)
	check(toph.bending.click_at(toph,rock.position),"Toph can raise the air-moved rock")
	await frames(40)
	check(rock.raised,"The shared rock retains its separate raise/lower reaction")
	var push = scene.bending_modes[&"toph"][2]
	push.select_technique(toph)
	var before: Vector2=rock.position
	check(push.click_at(toph,rock.position),"Toph has an explicit earth-push action")
	await frames(40)
	check(rock.position.x>before.x+31 and rock.raised,"Earth push preserves the rock's raised state")
	check(not rock.can_receive(scene.water.payload()),"Water does not reshape or push this rock")
	check(not rock.can_receive(zuko.bending.payload()),"Flame control does not reshape this rock")
	# Disabled/lowered collider must still sweep its full shape when pushed.
	rock.raised=false
	rock.collision_body.get_child(0).disabled=true
	rock.position=Vector2(285,350)
	push.cast_direction=Vector2.RIGHT
	check(not rock.receive_interaction(push.payload()),"Lowered rock cannot be pushed through a wall")
	rock.position=Vector2(-180,120)
	for actor in [aang,toph]:
		actor.position=Vector2(40,200+manager.roster.find(actor)*24)
	# Every elemental shot can hit the same fragile target interface and a mechanism.
	var Target=load("res://sandboxes/party_foundation/hit_target.gd")
	for actor in [manager.roster[0],aang,toph,zuko]:
		actor.position=Vector2(120,350)
		var shot=scene.water.shot if actor.character_id==&"katara" else scene.bending_modes[actor.character_id][1]
		var crate=Target.new()
		crate.position=Vector2(200,350)
		scene.add_child(crate)
		await frames(2)
		if actor.character_id==&"katara":
			scene.source.position=Vector2(140,350)
			scene.water.select_technique(actor)
			scene.water.click_at(actor,scene.source.position)
		check(shot.select_technique(actor) and shot.click_at(actor,crate.position),actor.name+" can shoot a fragile crate")
		check(not crate.broken,actor.name+" shot does not hit instantly")
		await frames(40)
		check(crate.broken and crate.hit_count==1,actor.name+" projectile destroys the fragile crate exactly once")
		check(not crate.can_receive(shot.payload()),"Broken crate rejects repeat "+actor.name+" hits")
		crate.queue_free()
		await frames(2)
		var mechanism=Target.new()
		mechanism.mechanism=true
		mechanism.position=Vector2(200,350)
		scene.add_child(mechanism)
		await frames(2)
		if actor.character_id==&"katara":
			scene.water.click_at(actor,scene.source.position)
		shot.click_at(actor,mechanism.position)
		await frames(40)
		check(mechanism.activated and not mechanism.broken,actor.name+" shot activates an impact mechanism without breaking it")
		mechanism.queue_free()
		actor.position=Vector2(40,120+manager.roster.find(actor)*24)
		await frames(2)
	var katara=manager.roster[0]
	katara.position=Vector2(120,350)
	var water_shot=scene.water.shot
	check(not scene.water.carrying and not water_shot.click_at(katara,Vector2(200,350)),"Water Shot requires actual collected water for every launch")
	var far=Target.new()
	far.position=Vector2(290,350)
	scene.add_child(far)
	var fire_shot=scene.bending_modes[&"zuko"][1]
	zuko.position=Vector2(120,350)
	fire_shot.select_technique(zuko)
	fire_shot.click_at(zuko,far.position)
	await frames(65)
	check(far.hit_count==0 and not fire_shot.casting,"Shots expire at their maximum range")
	far.position=Vector2(360,350)
	zuko.position=Vector2(280,350)
	await frames(2)
	fire_shot.click_at(zuko,far.position)
	await frames(45)
	check(far.hit_count==0,"Projectiles cannot pass through solid walls")
	zuko.position=Vector2(200,350)
	far.position=Vector2(260,350)
	await frames(2)
	check(not far.can_receive(zuko.bending.payload()),"Flame control remains non-damaging; attacks require strike utility")
	fire_shot.click_at(zuko,far.position)
	await frames(2)
	var saved: Vector2=fire_shot.effect_position
	scene.ui.open_modal("inventory")
	scene.ui.show_inventory()
	await create_timer(0.08,true,false,true).timeout
	check(fire_shot.effect_position==saved and far.hit_count==0,"Inventory pauses in-flight projectiles before impact")
	scene.ui.close_modal()
	fire_shot.cancel()
	await frames(30)
	check(far.hit_count==0,"Cancelling an in-flight shot prevents its hit")
	print("SHARED REACTION TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
