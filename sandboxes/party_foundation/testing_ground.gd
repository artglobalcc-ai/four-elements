extends Node2D

const TerrainSurface = preload("res://sandboxes/party_foundation/terrain_surface.gd")
const Actor = preload("res://sandboxes/party_foundation/actor.gd")
const Inventory = preload("res://sandboxes/party_foundation/inventory_model.gd")
const Manager = preload("res://sandboxes/party_foundation/party_manager.gd")
const Interface = preload("res://sandboxes/party_foundation/interface.gd")
const Target = preload("res://sandboxes/party_foundation/hit_target.gd")
const CLUB = preload("res://sandboxes/party_foundation/sokkas_club.tres")
const IcePlatform = preload("res://sandboxes/party_foundation/ice_platform.gd")
const Projectile = preload("res://sandboxes/party_foundation/element_projectile.gd")
const ElementController = preload("res://sandboxes/party_foundation/element_controller.gd")
const BendingProp = preload("res://sandboxes/party_foundation/bending_prop.gd")
const Water = preload("res://sandboxes/party_foundation/water_controller.gd")
const EnvironmentTarget = preload("res://sandboxes/party_foundation/environment_target.gd")
const KATARA = preload("res://assets/characters/katara/katara_animations.tres")
const SOKKA = preload("res://assets/characters/sokka/sokka_animations.tres")
const GRID: int = 16
const BOUNDS := Rect2(-640, 0, 1280, 448)
const GATE := Rect2(304, 192, 32, 64)
const WATER_GATE := Rect2(80, 80, 80, 16)
var terrain_surfaces: Array = []
var navigation := AStarGrid2D.new()
var gate_closed: bool = false
var gate_body: StaticBody2D
var manager: Node
var ui: CanvasLayer
var world_clock: float = 0.0
var puddle: Node2D
var ice_platform: Node2D
var bending_modes: Dictionary = {}
var active_bending_modes: Dictionary = {}
var earth_prop: Node2D
var air_prop: Node2D
var brazier: Node2D
var water: Node2D
var source: Node2D
var reservoir: Node2D
var fire: Node2D
var vessel: Node2D
var water_gate_closed: bool = true
var water_gate_body: StaticBody2D
var obstacles: Array[Rect2] = [Rect2(-16,0,16,96), Rect2(304, 0, 32, 192), Rect2(304, 256, 32, 192), Rect2(0,80,80,16), Rect2(160,80,144,16)]

func _ready() -> void:
	# Characters and upright props share one foot-position depth-sorting context.
	y_sort_enabled = true
	for definition in [["split_group", KEY_T], ["cycle_group", KEY_R]]:
		if not InputMap.has_action(definition[0]):
			InputMap.add_action(definition[0])
			var key := InputEventKey.new()
			key.physical_keycode = definition[1]
			InputMap.action_add_event(definition[0], key)
	navigation.region = Rect2i(-40, 0, 80, 28)
	navigation.cell_size = Vector2(GRID, GRID)
	navigation.offset = Vector2(GRID / 2.0, GRID / 2.0)
	navigation.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	navigation.update()
	for obstacle in obstacles:
		add_wall(obstacle)
	for border in [Rect2(-656,-16,1312,16), Rect2(-656,448,1312,16), Rect2(-656,0,16,448), Rect2(640,0,16,448)]:
		add_wall(border)
	gate_body = add_wall(GATE)
	gate_body.get_child(0).disabled = true
	water_gate_body = add_wall(WATER_GATE)
	for entry in [[Rect2(-24,320,96,64),16.0,4],[Rect2(-24,408,96,24),40.0,16]]:
		var surface = TerrainSurface.new()
		surface.position = entry[0].position
		surface.footprint.size = entry[0].size
		surface.elevation = entry[1]
		surface.collision_bit = entry[2]
		terrain_surfaces.append(surface)
		add_child(surface)
	refresh_navigation()
	var actors: Array = []
	var names: Array = ["Katara", "Sokka", "Aang", "Toph", "Zuko"]
	var colors: Array[Color] = [Color.WHITE, Color.WHITE, Color(1,0.8,0.5), Color(0.55,1,0.65), Color(1,0.55,0.5)]
	var actors_node := Node2D.new()
	actors_node.name = "Characters"
	actors_node.y_sort_enabled = true
	actors_node.z_index = 1
	add_child(actors_node)
	for i in range(names.size()):
		var actor = Actor.new()
		actor.name = names[i]
		actor.world = self
		actor.character_id = StringName(names[i].to_lower())
		actor.position = Vector2(160, 224 + i * 28)
		actor.walk_speed = 90.0
		actor.jump_travel_speed = 90.0
		actor.collision_layer = 2
		actor.collision_mask = 1
		actor.motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
		var sprite := AnimatedSprite2D.new()
		sprite.name = "AnimatedSprite2D"
		sprite.sprite_frames = KATARA if i == 0 else SOKKA
		sprite.scale = Vector2(0.32,0.32)
		sprite.position = Vector2(0,-13)
		sprite.modulate = colors[i]
		actor.add_child(sprite)
		var collider := CollisionShape2D.new()
		var circle := CircleShape2D.new()
		circle.radius = 5.0
		collider.shape = circle
		actor.add_child(collider)
		var label := Label.new()
		label.text = names[i] + ("*" if i >= 2 else "")
		label.position = Vector2(-18, 7)
		label.add_theme_font_size_override("font_size", 8)
		label.modulate = Color(0.12,0.23,0.3)
		actor.add_child(label)
		actor.inventory = Inventory.new(actor.character_id)
		actors_node.add_child(actor)
		actors.append(actor)
	actors[0].inventory.on_person[0] = ItemStack.new(load("res://Items/fish1.tres"),15)
	actors[1].inventory.on_person[0] = ItemStack.new(load("res://Items/sokkas_club.tres"),1)
	actors[1].weapon_definition = CLUB
	for actor in actors:
		actor.attack_impact.connect(resolve_attack)
	for target_position in [Vector2(220,220),Vector2(420,300)]:
		var target = Target.new()
		target.position = target_position
		add_child(target)
	var camera := Camera2D.new()
	camera.name = "SandboxCamera"
	camera.zoom = Vector2(0.8,0.8)
	add_child(camera)
	manager = Manager.new()
	manager.name = "PartyManager"
	add_child(manager)
	manager.configure(actors,self,camera)
	source = add_environment_target(&"pool_01", "source", Vector2(100,160))
	reservoir = add_environment_target(&"reservoir_01", "reservoir", Vector2(250,145))
	reservoir.reaction_profile = load("res://sandboxes/party_foundation/reservoir_reaction.tres")
	reservoir.state_changed.connect(_on_reservoir_reaction)
	fire = add_environment_target(&"fire_01", "fire", Vector2(235,285))
	fire.reaction_profile = load("res://sandboxes/party_foundation/fire_reaction.tres")
	vessel = add_environment_target(&"vessel_01","vessel",Vector2(95,285))
	vessel.reaction_profile = load("res://sandboxes/party_foundation/reservoir_reaction.tres")
	water = Water.new()
	water.name = "KataraWaterManipulation"
	water.owner_actor = actors[0]
	water.world = self
	actors[0].bending = water
	add_child(water)
	for entry in [[actors[2],"air",Color("d4f4f3")],[actors[3],"earth",Color("9c8868")],[actors[4],"fire",Color("f78b35")]]:
		var controller = ElementController.new()
		controller.owner_actor = entry[0]
		controller.world = self
		controller.definition = load("res://sandboxes/party_foundation/"+entry[1]+"_basic.tres")
		controller.tint = entry[2]
		entry[0].bending = controller
		add_child(controller)
	for entry in [[actors[0],"water",Color("359cdb")],[actors[2],"air",Color("d4f4f3")],[actors[3],"earth",Color("9c8868")],[actors[4],"fire",Color("f78b35")]]:
		var shot = Projectile.new()
		shot.owner_actor = entry[0]
		shot.world = self
		shot.definition = load("res://sandboxes/party_foundation/"+entry[1]+"_shot.tres")
		shot.tint = entry[2]
		shot.requires_water = entry[1] == "water"
		add_child(shot)
		bending_modes[entry[0].character_id] = {0:entry[0].bending,1:shot}
	water.shot = bending_modes[&"katara"][1]
	var freeze = ElementController.new()
	freeze.owner_actor = actors[0]
	freeze.world = self
	freeze.definition = load("res://sandboxes/party_foundation/freeze.tres")
	freeze.tint = Color("b8efff")
	freeze.refusal_message = "Cannot thaw: move everyone off the ice platform first."
	add_child(freeze)
	bending_modes[&"katara"][1] = freeze
	ice_platform = IcePlatform.new()
	ice_platform.world = self
	ice_platform.position = Vector2(-485,155)
	add_child(ice_platform)
	for actor in actors:
		actor.inventory.selected_quick_slot = 0
		if actor.bending != null:
			actor.bending.selected = true
	var earth_push = ElementController.new()
	earth_push.owner_actor = actors[3]
	earth_push.world = self
	earth_push.definition = load("res://sandboxes/party_foundation/earth_push.tres")
	earth_push.tint = Color("9c8868")
	add_child(earth_push)
	bending_modes[&"toph"][2] = earth_push
	earth_prop = add_bending_prop("earth",Vector2(-180,120))
	earth_prop.reaction_profiles.assign([load("res://sandboxes/party_foundation/air_basic_reaction.tres"),load("res://sandboxes/party_foundation/earth_push_reaction.tres")])
	air_prop = add_bending_prop("air",Vector2(-490,345))
	brazier = add_environment_target(&"brazier_01","fire",Vector2(-180,345))
	brazier.burning = false
	brazier.reaction_profile = load("res://sandboxes/party_foundation/fire_reaction.tres")
	brazier.ignition_profile = load("res://sandboxes/party_foundation/fire_basic_reaction.tres")
	fire.ignition_profile = brazier.ignition_profile
	add_environment_target(&"training_pool","source",Vector2(-525,115))
	puddle = add_environment_target(&"training_puddle","source",Vector2(-580,130))
	puddle.radius = 10.0
	puddle.source_label = "Puddle"
	puddle.water_material.renewable = false
	puddle.water_material.capacity = 2
	puddle.water_amount = 2
	puddle.reaction_profile = reservoir.reaction_profile
	var training_vessel = add_environment_target(&"training_vessel","vessel",Vector2(-430,135))
	training_vessel.reaction_profile = reservoir.reaction_profile
	var training_fire = add_environment_target(&"training_fire","fire",Vector2(-425,70))
	training_fire.reaction_profile = fire.reaction_profile
	training_fire.ignition_profile = brazier.ignition_profile
	for point in [Vector2(-550,180),Vector2(-240,180),Vector2(-550,405),Vector2(-240,405)]:
		var crate = Target.new()
		crate.position = point
		add_child(crate)
		var switch_target = Target.new()
		switch_target.mechanism = true
		switch_target.position = point+Vector2(100,0)
		add_child(switch_target)
	ui = Interface.new()
	ui.name = "SandboxInterface"
	ui.manager = manager
	ui.world = self
	add_child(ui)
	queue_redraw()

func terrain_height_at(point: Vector2, margin: float = 5.0) -> float:
	for surface in terrain_surfaces:
		var rectangle: Rect2 = surface.world_rect()
		if rectangle.grow(margin).has_point(point):
			return surface.elevation if rectangle.grow(-margin).has_point(point) else -1.0
	return 0.0

func terrain_collision_mask(height: float) -> int:
	var mask: int = 1 # Props and ordinary walls always block, independent of jump height.
	for surface in terrain_surfaces:
		if height < surface.elevation-0.01:
			mask |= surface.collision_bit
	return mask

func jump_landing_allowed(point: Vector2) -> bool:
	if not BOUNDS.grow(-6).has_point(point) or terrain_height_at(point)<0:
		return false
	# Containers and fire pits are not terrain, including placeholder props without colliders.
	for target in get_tree().get_nodes_in_group("sandbox_environment_targets"):
		if target.kind in ["vessel","reservoir","fire"] and point.distance_to(target.global_position)<target.radius+5:
			return false
	return true

func current_bending(actor: Node) -> Node:
	return active_bending_modes.get(actor.character_id,actor.bending)

func add_bending_prop(element: String, point: Vector2) -> Node2D:
	var prop = BendingProp.new()
	prop.kind = element
	prop.world = self
	prop.position = point
	prop.reaction_profile = load("res://sandboxes/party_foundation/"+element+"_basic_reaction.tres")
	add_child(prop)
	return prop

func add_environment_target(id: StringName, kind: String, point: Vector2) -> Node2D:
	var target = EnvironmentTarget.new()
	target.name = String(id)
	target.object_id = id
	target.world = self
	target.kind = kind
	target.position = point
	add_child(target)
	return target

func _on_reservoir_reaction(_target: Node, result: StringName) -> void:
	if result in [&"fill", &"drained"]:
		water_gate_closed = not reservoir.filled
		water_gate_body.get_child(0).set_deferred("disabled", not water_gate_closed)
		refresh_navigation()
		queue_redraw()

func add_wall(rectangle: Rect2) -> StaticBody2D:
	var body := StaticBody2D.new()
	body.position = rectangle.get_center()
	var collision := CollisionShape2D.new()
	var shape := RectangleShape2D.new()
	shape.size = rectangle.size
	collision.shape = shape
	body.add_child(collision)
	add_child(body)
	return body

func refresh_navigation() -> void:
	var blocked_rectangles: Array[Rect2] = obstacles.duplicate()
	for surface in terrain_surfaces:
		blocked_rectangles.append(surface.world_rect())
	if water_gate_closed:
		blocked_rectangles.append(WATER_GATE)
	for target in get_tree().get_nodes_in_group("sandbox_hit_targets"):
		if not target.broken:
			blocked_rectangles.append(Rect2(target.global_position-Vector2(10,10),Vector2(20,20)))
	for prop in get_tree().get_nodes_in_group("sandbox_bending_obstacles"):
		var rectangle: Rect2 = prop.obstacle_rect()
		if rectangle.has_area():
			blocked_rectangles.append(rectangle)
	for y in range(28):
		for x in range(-40,40):
			var point := Vector2(x * GRID + GRID / 2.0,y * GRID + GRID / 2.0)
			var solid: bool = false
			for rectangle in blocked_rectangles:
				if rectangle.grow(5.0).has_point(point):
					solid = true
			if gate_closed and GATE.grow(5.0).has_point(point):
				solid = true
			navigation.set_point_solid(Vector2i(x,y),solid)

func find_route(from: Vector2, to: Vector2) -> PackedVector2Array:
	refresh_navigation()
	var start := Vector2i(floori(from.x / GRID),floori(from.y / GRID))
	var finish := Vector2i(floori(to.x / GRID),floori(to.y / GRID))
	if not navigation.region.has_point(start) or not navigation.region.has_point(finish):
		return PackedVector2Array()
	if navigation.is_point_solid(start) or navigation.is_point_solid(finish):
		return PackedVector2Array()
	var points: PackedVector2Array = navigation.get_point_path(start,finish)
	if not points.is_empty():
		# Include the cell center to stay clear of corners, then the exact destination.
		points.append(to)
	return points

func toggle_gate() -> void:
	if not gate_closed:
		for actor in manager.roster:
			if GATE.grow(7.0).has_point(actor.global_position):
				manager.message = "Move everyone clear of the gate before closing it."
				return
	gate_closed = not gate_closed
	gate_body.get_child(0).set_deferred("disabled",not gate_closed)
	refresh_navigation()
	manager.message = "Ice gate closed: test blocked regrouping." if gate_closed else "Ice gate open: regrouping can use the passage."
	queue_redraw()

func resolve_attack(actor: Node, definition: Resource, direction: Vector2) -> void:
	var hits: int = 0
	for target in get_tree().get_nodes_in_group("sandbox_hit_targets"):
		var offset: Vector2 = target.global_position - actor.global_position
		if offset.length() > definition.reach or offset.length() < 0.001:
			continue
		if direction.dot(offset.normalized()) < cos(deg_to_rad(definition.half_angle_degrees)):
			continue
		var query := PhysicsRayQueryParameters2D.create(actor.global_position,target.global_position,1)
		var obstacle: Dictionary = get_world_2d().direct_space_state.intersect_ray(query)
		if not obstacle.is_empty() and obstacle.collider != target:
			continue
		var result: Dictionary = target.receive_hit({"source":actor.character_id,"utility":definition.utility,
			"element":definition.element,"force":definition.force,"damage":definition.damage})
		if result.accepted:
			hits += 1
	manager.message = "%s: %d target(s) hit." % [actor.name,hits]

func _physics_process(delta: float) -> void:
	world_clock += delta

func _draw() -> void:
	draw_rect(BOUNDS,Color("d8e9ed"))
	var rooms: Array = [
		[Rect2(-608,24,256,176),Color("c3e1ec"),"WATER - KATARA","1: collect / place / shoot; 2: freeze"],
		[Rect2(-304,24,256,176),Color("d9d5bb"),"EARTH - TOPH","1: raise/lower; 2: shoot; 3: push"],
		[Rect2(-608,248,256,176),Color("e1ede7"),"AIR - AANG","1: push block or stone; 2: shoot"],
		[Rect2(-304,248,256,176),Color("e9d4c0"),"FIRE - ZUKO","1: flame on/off; 2: shoot"]]
	var room_font: Font = ThemeDB.fallback_font
	for room in rooms:
		draw_rect(room[0],room[1])
		draw_rect(room[0],Color("72949b"),false,2)
		draw_string(room_font,room[0].position+Vector2(12,22),room[2],HORIZONTAL_ALIGNMENT_LEFT,-1,12,Color("244451"))
		draw_string(room_font,room[0].position+Vector2(12,40),room[3],HORIZONTAL_ALIGNMENT_LEFT,-1,9,Color("244451"))
	draw_string(room_font,Vector2(-530,228),"ELEMENT TRAINING   <----    SPAWN / PARTY COURSE    ---->",HORIZONTAL_ALIGNMENT_LEFT,-1,11,Color("244451"))
	draw_string(room_font,Vector2(16,200),"<-- Bending areas",HORIZONTAL_ALIGNMENT_LEFT,-1,10,Color("244451"))
	for x in range(-640,641,32):
		draw_line(Vector2(x,0),Vector2(x,448),Color(0.5,0.7,0.75,0.12))
	for y in range(0,449,32):
		draw_line(Vector2(-640,y),Vector2(640,y),Color(0.5,0.7,0.75,0.12))
	for rectangle in obstacles:
		draw_rect(rectangle,Color("78aabd"))
		draw_rect(Rect2(rectangle.position,Vector2(rectangle.size.x,7)),Color("b4e4ec"))
	draw_rect(GATE,Color("567e9c") if gate_closed else Color("afcbd2"))
	draw_rect(WATER_GATE,Color("275d87") if water_gate_closed else Color("a9d6dd"))
	draw_circle(Vector2(520,220),27.0,Color("d9c58d"))
	draw_arc(Vector2(520,220),27.0,0,TAU,32,Color("8c7840"),2)
	var font: Font = ThemeDB.fallback_font
	draw_string(font,Vector2(70,55),"Reservoir gate",HORIZONTAL_ALIGNMENT_LEFT,-1,10,Color("244451"))
	draw_string(font,Vector2(18,115),"KATARA: 1 selects Water Manipulation",HORIZONTAL_ALIGNMENT_LEFT,-1,10,Color("244451"))
	draw_string(font,Vector2(350,175),"F: ice gate",HORIZONTAL_ALIGNMENT_LEFT,-1,12,Color("244451"))
	draw_string(font,Vector2(465,265),"Full-party event pad",HORIZONTAL_ALIGNMENT_LEFT,-1,11,Color("244451"))
	draw_string(font,Vector2(-24,294),"SPACE: terrain jump",HORIZONTAL_ALIGNMENT_LEFT,-1,10,Color("244451"))
	draw_string(font,Vector2(30,420),"* Aang / Toph / Zuko use tinted stand-in art",HORIZONTAL_ALIGNMENT_LEFT,-1,10,Color("244451"))
