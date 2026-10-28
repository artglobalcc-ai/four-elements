extends SceneTree
var checks: int=0
var failures: int=0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	checks+=1
	if ok: print("PASS: "+label)
	else:
		failures+=1
		push_error("FAIL: "+label)
func frames(count: int) -> void:
	for i in range(count): await physics_frame
func release() -> void:
	for action in ["move_right","move_left","move_up","move_down"]: Input.action_release(action)
func place(actor: Node, point: Vector2, height: float=0) -> void:
	release()
	actor.position=point
	actor.set_ground_height(height)
func run() -> void:
	var scene=load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene=scene
	await frames(3)
	var manager=scene.manager
	var actor=manager.roster[0]
	var full_party: Array=manager.roster.duplicate()
	manager.set_physics_process(false)
	manager.active_group().members=[actor]
	for member in manager.roster: member.position=Vector2(120,120+manager.roster.find(member)*25)
	place(actor,Vector2(140,350))
	actor.start_jump(Vector2.ZERO)
	await frames(15)
	check(actor.world_height>10 and actor.position.distance_to(Vector2(140,350))<0.1,"No movement input produces an in-place jump")
	await frames(25)
	check(not actor.is_jumping and actor.ground_height==0,"Standing jump lands without translating")
	place(actor,Vector2(140,350))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(8)
	release()
	var stopped: Vector2=actor.position
	check(actor.is_jumping and stopped.x>145,"Held movement advances during the jump")
	await frames(8)
	check(actor.is_jumping and actor.position.distance_to(stopped)<0.1,"Releasing input stops horizontal travel while still airborne")
	await frames(25)
	var short_distance: float=actor.position.x-140
	place(actor,Vector2(140,350))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(32)
	release()
	var long_distance: float=actor.position.x-140
	check(long_distance>short_distance+20,"Holding input travels farther than releasing early")
	await frames(8)
	place(actor,Vector2(140,350))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(8)
	release()
	var corner: Vector2=actor.position
	Input.action_press("move_down")
	await frames(8)
	release()
	check(actor.position.y>corner.y+8 and absf(actor.position.x-corner.x)<0.1,"Changing direction steers the current jump")
	var before_reverse: Vector2=actor.position
	Input.action_press("move_left")
	await frames(6)
	release()
	check(actor.position.x<before_reverse.x-5,"A jump can reverse horizontal direction")
	await frames(20)
	place(actor,Vector2(140,350))
	Input.action_press("move_right")
	Input.action_press("move_down")
	actor.start_jump(Vector2(1,1))
	await frames(8)
	release()
	var diagonal: Vector2=actor.position-Vector2(140,350)
	check(absf(diagonal.x-diagonal.y)<0.1 and diagonal.length()<15,"Diagonal air movement is normalized rather than faster")
	check(String(actor.sprite.animation).begins_with("jump_"),"Diagonal steering uses an available jump pose")
	await frames(35)
	place(actor,Vector2(-31,344))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(25)
	release()
	check(not actor.is_jumping and actor.ground_height==16,"Live input climbs the low ledge from a flush approach")
	check(actor.position.x < 10,"Landing is determined by actual travel rather than a fixed endpoint")
	place(actor,Vector2(-18,344),16)
	Input.action_press("move_left")
	actor.start_jump(Vector2.LEFT)
	await frames(45)
	release()
	check(not actor.is_jumping and actor.ground_height==0,"Jumping down falls to the lower terrain surface")
	place(actor,Vector2(-31,420))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(40)
	release()
	check(actor.position.x < -28 and actor.ground_height==0,"Too-high terrain blocks travel but allows jumping")
	place(actor,Vector2(185,220))
	Input.action_press("move_right")
	await frames(25)
	var crate_contact: Vector2=actor.position
	actor.start_jump(Vector2.RIGHT)
	await frames(15)
	check(actor.world_height>10 and actor.position.distance_to(crate_contact)<0.1,"A crate blocks horizontal travel throughout an input-controlled jump")
	await frames(25)
	release()
	check(actor.ground_height==0 and actor.position.x<210,"Jumping never turns a crate into a terrain support")
	place(actor,Vector2(140,350))
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(5)
	var position_before: Vector2=actor.position
	var height_before: float=actor.world_height
	scene.ui.open_modal("inventory")
	scene.ui.show_inventory()
	await create_timer(0.08,true,false,true).timeout
	check(actor.position==position_before and actor.world_height==height_before,"Inventory pauses air control and the vertical arc")
	scene.ui.close_modal()
	release()
	await frames(40)
	# Record a right-then-down arc and verify followers replay it, not a straight chord.
	manager.active_group().members=full_party
	for i in range(full_party.size()): place(full_party[i],Vector2(-440-i*28,224))
	manager.active_group().reset_route()
	manager.refresh_control()
	manager.set_physics_process(true)
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(12)
	release()
	var bend: Vector2=actor.position
	Input.action_press("move_down")
	await frames(12)
	release()
	await frames(12)
	var trace: Array=actor.jump_trace.duplicate(true)
	check(trace.size()>20 and trace[-1].distance>trace[0].position.distance_to(trace[-1].position)+5,"Jump history records the curved traveled path")
	var visited_corner: bool=false
	for i in range(180):
		if i<40: Input.action_press("move_right")
		elif i<80:
			Input.action_release("move_right")
			Input.action_press("move_down")
		else: release()
		await physics_frame
		var follower=full_party[1]
		visited_corner=visited_corner or (not follower.replay_trace.is_empty() and follower.position.distance_to(bend)<3)
	release()
	check(visited_corner,"Follower replays the recorded midair corner")
	check(full_party.all(func(member): return not member.is_jumping and member.ground_height==0),"Curved jump replay completes safely for the full party")
	# Verify all five can still traverse a terrain ledge under continuous input.
	for i in range(full_party.size()): place(full_party[i],Vector2(-31-i*28,344))
	manager.active_group().reset_route()
	Input.action_press("move_right")
	actor.start_jump(Vector2.RIGHT)
	await frames(50)
	release()
	Input.action_press("move_down")
	await frames(15)
	release()
	Input.action_press("move_left")
	await frames(25)
	release()
	await frames(200)
	for member in full_party: print("AIR PARTY ",member.name," ",member.position," height=",member.ground_height)
	check(full_party.all(func(member): return not member.is_jumping and member.ground_height==16),"All five replay an input-controlled jump onto the low ledge")
	print("AIR CONTROL TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
