extends SceneTree
func _initialize():
	call_deferred("run")
func run():
	var scene = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	await physics_frame
	await physics_frame
	var manager = scene.manager
	var leader = manager.roster[0]
	leader.position = Vector2(190, 260)
	for i in range(1, manager.roster.size()):
		manager.roster[i].position = Vector2(130, 330 + i * 16)
	manager.active_group().reset_route()
	manager.split_selected([&"katara"])
	manager.request_regroup()
	var initial: Vector2 = manager.roster[1].position
	var guarded: bool = not manager.can_change_world_scene()
	for i in range(180):
		# Keep the destination moving more than the replan threshold each few frames.
		leader.move_and_collide(Vector2(0.6, 0))
		await physics_frame
	var joined: bool = manager.full_party_present()
	print("MOVING RECALL: joined=", joined, " returning actor moved=", manager.roster[1].position.distance_to(initial), " transition guarded=", guarded)
	quit(0 if joined and guarded and manager.can_change_world_scene() else 1)
