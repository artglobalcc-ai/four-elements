extends SceneTree
func _initialize() -> void:
	call_deferred("run")
func run() -> void:
	var scene = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	await physics_frame
	await physics_frame
	var good: bool = scene.BOUNDS.position.x == -640 and scene.navigation.region.position.x == -40
	for destination in [Vector2(-580,160),Vector2(-220,160),Vector2(-550,370),Vector2(-230,370)]:
		var route: PackedVector2Array = scene.find_route(Vector2(160,224),destination)
		good = good and not route.is_empty()
		print("TRAINING ROUTE ", destination," reachable=",not route.is_empty())
	var liquid_cell := Vector2i(floori(scene.ice_platform.position.x/16),floori(scene.ice_platform.position.y/16))
	good = good and scene.navigation.is_point_solid(liquid_cell)
	print("LIQUID CROSSING: blocks navigation before freezing=",scene.navigation.is_point_solid(liquid_cell))
	good = good and scene.earth_prop.position.x<0 and scene.air_prop.position.x<0 and scene.brazier.position.x<0
	print("TRAINING LAYOUT: ", "PASS" if good else "FAIL")
	quit(0 if good else 1)
