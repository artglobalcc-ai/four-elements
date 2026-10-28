extends SceneTree
var checks: int=0
var failures: int=0
func _initialize() -> void:
	call_deferred("run")
func check(ok: bool, label: String) -> void:
	checks+=1
	if ok:
		print("PASS: "+label)
	else:
		failures+=1
		push_error("FAIL: "+label)
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
	for actor in manager.roster:
		actor.set_player_controlled(false)
		var collider: CollisionShape2D
		for child in actor.get_children():
			if child is CollisionShape2D:
				collider=child
		check(collider.position==Vector2.ZERO and collider.shape.radius==5,actor.name+" uses the same centered foot collider")
		var all_aligned: bool=true
		var total: int=0
		for animation in actor.sprite.sprite_frames.get_animation_names():
			actor.sprite.animation=animation
			actor.sprite.pause()
			for index in range(actor.sprite.sprite_frames.get_frame_count(animation)):
				actor.sprite.frame=index
				actor.align_sprite_feet()
				var texture: Texture2D=actor.sprite.sprite_frames.get_frame_texture(animation,index)
				var used: Rect2i=actor.visible_frame_bounds(texture)
				var center: Vector2=texture.get_size()*0.5
				var foot: Vector2=Vector2(used.position.x+used.size.x*0.5,used.end.y)
				var anchored: Vector2=actor.sprite.position+(foot-center)*actor.sprite.scale
				all_aligned=all_aligned and anchored.length()<0.001
				total+=1
		check(all_aligned,actor.name+": all "+str(total)+" animation frames place visible feet at the collider origin")
		var idle=actor.sprite.sprite_frames.get_frame_texture("idle_down",0)
		check(absf(actor.visible_frame_bounds(idle).size.y*actor.sprite.scale.y-24)<0.001,actor.name+" uses the standardized idle body height")
		actor.play_animation("idle_down")
	# Start from a genuinely flush approach, rather than a hand-picked takeoff distance.
	var katara=manager.roster[0]
	katara.set_player_controlled(true)
	katara.position=Vector2(-50,344)
	Input.action_press("move_right")
	await frames(30)
	Input.action_release("move_right")
	var takeoff: Vector2=katara.position
	check(takeoff.x < -24 and takeoff.x > -35,"Walking reaches the foot of the ledge")
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping,"A flush low ledge allows rising before forward travel")
	await frames(40)
	Input.action_release("move_right")
	check(katara.ground_height==16 and katara.last_jump_succeeded,"Flush ledge jump lands at terrain height")
	# Every follower repeats this exact flush takeoff and all frames remain foot-anchored.
	for i in range(manager.roster.size()):
		manager.roster[i].position=takeoff-Vector2(i*28,0)
		manager.roster[i].set_ground_height(0)
	manager.active_group().reset_route()
	manager.refresh_control()
	manager.set_physics_process(true)
	Input.action_press("move_right")
	katara.start_jump(Vector2.RIGHT)
	await frames(40)
	Input.action_release("move_right")
	Input.action_press("move_right")
	await frames(20)
	Input.action_release("move_right")
	Input.action_press("move_down")
	await frames(15)
	Input.action_release("move_down")
	Input.action_press("move_left")
	await frames(30)
	Input.action_release("move_left")
	await frames(200)
	var everyone: bool=true
	for actor in manager.roster:
		everyone=everyone and actor.ground_height==16 and not actor.is_jumping
	check(everyone,"All five followers complete the flush-contact ledge jump")
	# A too-high wall produces a synchronous hop without corrupting breadcrumbs.
	for i in range(manager.roster.size()):
		manager.roster[i].position=Vector2(-31-i*28,420)
		manager.roster[i].set_ground_height(0)
	manager.active_group().reset_route()
	var group=manager.active_group()
	var cursors: Dictionary=group.cursors.duplicate()
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping,"A no-input leader hop starts without forced travel")
	await frames(40)
	await frames(40)
	check(group.cursors==cursors and manager.roster.all(func(actor): return not actor.is_jumping and actor.ground_height==0),"In-place party hops finish without consuming route distance")
	# Reproduce holding a direction against an ordinary solid prop.
	manager.set_physics_process(false)
	manager.active_group().members=[katara]
	katara.position=Vector2(185,220)
	katara.set_ground_height(0)
	Input.action_press("move_right")
	await frames(25)
	var flush_crate: Vector2=katara.position
	check(flush_crate.x>200 and flush_crate.x<210,"Player walks flush against a real crate collision")
	katara.start_jump(Vector2.RIGHT)
	check(katara.is_jumping and katara.stationary_jump,"Pressing jump against that crate starts an in-place hop")
	await frames(15)
	check(katara.world_height>10 and katara.position.distance_to(flush_crate)<0.1,"A blocked hop reaches its apex without entering the crate")
	await frames(25)
	Input.action_release("move_right")
	check(not katara.is_jumping and katara.ground_height==0 and katara.position.distance_to(flush_crate)<0.1,"Holding movement against a crate remains safe through jump and landing")
	print("FOOT ALIGNMENT/FOLLOWER TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures==0 else 1)
