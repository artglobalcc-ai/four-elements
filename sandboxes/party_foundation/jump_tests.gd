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
	var manager=scene.manager
	manager.set_physics_process(false)
	var katara=manager.roster[0]
	var sokka=manager.roster[1]
	var full_members: Array=manager.active_group().members.duplicate()
	manager.active_group().members=[katara]
	for i in range(manager.roster.size()):
		manager.roster[i].position=Vector2(120,120+i*25)
	katara.position=Vector2(-44,344)
	katara.set_ground_height(0)
	check(scene.terrain_surfaces.size()==2,"Sandbox has designated low and high terrain surfaces")
	Input.action_press("move_right")
	await frames(20)
	Input.action_release("move_right")
	check(katara.ground_height==0 and katara.position.x < -24,"Walking cannot climb a ledge automatically")
	katara.position=Vector2(-44,344)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping,"Space-style jump starts toward reachable low terrain")
	await frames(10)
	check(katara.world_height>0 and katara.visuals.position.y<0,"Jump changes logical height and lifts the entire character visual")
	check(katara.sprite.position==katara.sprite_ground_position,"Sprite pose is separate from world height")
	var height: float=katara.world_height
	var position_before: Vector2=katara.position
	scene.ui.open_modal("inventory")
	scene.ui.show_inventory()
	await create_timer(0.08,true,false,true).timeout
	check(katara.world_height==height and katara.position==position_before,"Inventory pauses jump height, travel and landing")
	scene.ui.close_modal()
	await frames(30)
	Input.action_release("move_right")
	check(not katara.is_jumping and katara.last_jump_succeeded and katara.ground_height==16,"Jump lands on the low terrain at its actual height")
	check(katara.visuals.position.y==-16 and katara.world_height==16,"Standing on a ledge retains its height after the jump")
	Input.action_press("move_right")
	await frames(20)
	Input.action_release("move_right")
	check(katara.position.x>20 and katara.ground_height==16,"Character can walk on the elevated terrain")
	katara.position=Vector2(-18,344)
	katara.set_ground_height(16)
	Input.action_press("move_left")
	await frames(12)
	Input.action_release("move_left")
	check(katara.position.x>=-19 and katara.ground_height==16,"Walking off an elevated edge requires a deliberate jump")
	katara.position=Vector2(-4,344)
	Input.action_press("move_left")
	katara.start_jump(Vector2.LEFT)
	await frames(40)
	Input.action_release("move_right")
	Input.action_release("move_left")
	check(katara.last_jump_succeeded and katara.ground_height==0 and katara.position.x < -24,"Jumping down returns to ground height")
	katara.position=Vector2(-44,420)
	katara.set_ground_height(0)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping and katara.stationary_jump,"Unreachable terrain allows an in-place hop")
	await frames(40)
	Input.action_release("move_right")
	Input.action_release("move_left")
	check(katara.position.x < -24 and katara.ground_height==0,"Blocked jump stays below the high terrain")
	# Physical props remain blocking at every point of a jump arc.
	var crate=load("res://sandboxes/party_foundation/hit_target.gd").new()
	crate.position=Vector2(200,350)
	scene.add_child(crate)
	katara.position=Vector2(165,350)
	await frames(2)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping and katara.stationary_jump,"A crate blocks travel but still permits a hop")
	await frames(40)
	Input.action_release("move_right")
	Input.action_release("move_left")
	check(scene.terrain_height_at(crate.position)==0,"A crate never contributes terrain support height")
	katara.position=scene.fire.position-Vector2(45,0)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping and katara.stationary_jump,"A fire pit is not a landing but does not suppress jumping")
	await frames(40)
	Input.action_release("move_right")
	Input.action_release("move_left")
	katara.position=scene.vessel.position-Vector2(45,0)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping and katara.stationary_jump,"A vessel is not a landing but does not suppress jumping")
	await frames(40)
	Input.action_release("move_right")
	Input.action_release("move_left")
	crate.queue_free()
	manager.active_group().members=full_members
	manager.refresh_control()
	# Formation rotation transfers heights with physical slots, after everyone lands.
	katara.position=Vector2(0,344)
	katara.set_ground_height(16)
	sokka.position=Vector2(-44,344)
	sokka.set_ground_height(0)
	manager.active_group().reset_route()
	manager.rotate_leader()
	check(sokka.position==Vector2(0,344) and sokka.ground_height==16,"Tab preserves the front slot's terrain height")
	while manager.active_group().members[0] != katara:
		manager.rotate_leader()
	# Isolated breadcrumb replay: a follower must actually perform the same terrain jump.
	var group=manager.active_group()
	group.members=[katara,sokka]
	katara.position=Vector2(-44,344)
	katara.set_ground_height(0)
	sokka.position=Vector2(-72,344)
	sokka.set_ground_height(0)
	group.reset_route()
	manager.refresh_control()
	manager.set_physics_process(true)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping,"Leader starts a terrain jump with a following companion")
	manager.rotate_leader()
	check(manager.active_group().members[0]==katara,"Leader switching waits until active jumps finish")
	var follower_airborne: bool=false
	for i in range(100):
		await physics_frame
		follower_airborne=follower_airborne or (sokka.is_jumping and sokka.world_height>0)
	Input.action_release("move_right")
	check(follower_airborne,"Follower replays a real height-changing jump at the breadcrumb launch point")
	check(sokka.ground_height==16 and not sokka.is_jumping,"Follower lands on the same elevated terrain")
	check(not katara.is_jumping and katara.ground_height==16,"Leader remains safely on the ledge while follower catches up")
	print("TERRAIN JUMP TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
