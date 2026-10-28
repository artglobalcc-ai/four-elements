extends SceneTree
func _initialize() -> void:
	call_deferred("run")
func frames(count: int) -> void:
	for i in range(count):
		await physics_frame
func travel(action: String, count: int) -> void:
	Input.action_press(action)
	await frames(count)
	Input.action_release(action)
func run() -> void:
	var scene=load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene=scene
	await frames(3)
	var manager=scene.manager
	for i in range(manager.roster.size()):
		manager.roster[i].position=Vector2(-44-i*28,344)
		manager.roster[i].set_ground_height(0)
	manager.active_group().reset_route()
	Input.action_press("move_right")
	manager.roster[0].start_jump(Vector2.RIGHT)
	await frames(40)
	Input.action_release("move_right")
	await travel("move_right",30)
	await travel("move_down",15)
	await travel("move_left",30)
	await frames(200)
	var valid: bool=true
	for actor in manager.roster:
		print("PARTY JUMP ",actor.name," height=",actor.ground_height," position=",actor.position," jumping=",actor.is_jumping)
		valid=valid and actor.ground_height==16 and not actor.is_jumping
	print("FIVE-CHARACTER JUMP: ","PASS" if valid else "FAIL")
	quit(0 if valid else 1)
