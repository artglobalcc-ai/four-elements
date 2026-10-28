extends SceneTree

var failures: int = 0
var checks: int = 0

func _initialize() -> void:
	call_deferred("run")

func check(value: bool, description: String) -> void:
	checks += 1
	if not value:
		failures += 1
		push_error("FAIL: " + description)
	else:
		print("PASS: " + description)

func frames(count: int) -> void:
	for i in range(count):
		await physics_frame

func key(interface: Node, code: Key) -> void:
	var event := InputEventKey.new()
	event.keycode = code
	event.physical_keycode = code
	event.pressed = true
	interface._input(event)

func run() -> void:
	var scene = load("res://sandboxes/party_foundation/testing_ground.tscn").instantiate()
	root.add_child(scene)
	current_scene = scene
	await frames(3)
	var manager = scene.manager
	var ui = scene.ui
	var katara = manager.roster[0]
	var sokka = manager.roster[1]
	var aang = manager.roster[2]
	var toph = manager.roster[3]
	var zuko = manager.roster[4]
	check(manager.groups.size() == 1 and manager.full_party_present(),"Five characters begin in one full party")
	var split_key := InputEventKey.new()
	split_key.keycode = KEY_T
	split_key.physical_keycode = KEY_T
	split_key.pressed = true
	ui._input(split_key)
	split_key.pressed = false
	ui._input(split_key)
	check(ui.modal == "split" and paused,"Tap T opens a paused manual split menu")
	ui.close_modal()
	split_key.pressed = true
	ui._input(split_key)
	ui._process(0.6)
	split_key.pressed = false
	ui._input(split_key)
	check(ui.modal.is_empty() and not paused,"Holding T regroups without also opening split menu")
	var positions: Array = []
	for actor in manager.active_group().members:
		positions.append(actor.position)
	key(ui,KEY_TAB)
	check(manager.active_group().members[0] == sokka and manager.active_group().members[-1] == katara,"Tab cycles the leader to back")
	check(sokka.position == positions[0] and katara.position == positions[-1],"Rotation preserves physical formation slots")
	check(katara.inventory.on_person[0].quantity == 15 and sokka.inventory.on_person[0].item.item_id == "sokkas_club","Inventory belongs to character after rotation")
	check(manager.active_group().members[0].concentration_remaining == 0,"No concentration starts implicitly")
	sokka.sustain_demo()
	key(ui,KEY_E)
	check(paused and ui.modal == "inventory" and ui.viewed_index == 0,"E pauses and opens selected leader inventory")
	var clock: float = scene.world_clock
	var concentration: float = sokka.concentration_remaining
	var saved_position: Vector2 = sokka.position
	await create_timer(0.12,true,false,true).timeout
	check(scene.world_clock == clock and sokka.concentration_remaining == concentration and sokka.position == saved_position,"World, concentration and motion freeze in inventory")
	key(ui,KEY_TAB)
	check(ui.viewed_index == 1 and manager.active_group().members[0] == sokka,"Inventory Tab changes viewed owner without rotating world party")
	key(ui,KEY_ESCAPE)
	await frames(3)
	check(not paused and scene.world_clock > clock and sokka.concentration_remaining < concentration,"Closing inventory resumes world and concentration")
	while manager.active_group().members[0] != katara:
		manager.rotate_leader()
	check(manager.split_selected([&"katara",&"aang"]),"Split keeps Katara and Aang together")
	check(manager.groups[1].members.has(sokka) and manager.groups[1].members.has(toph),"Unselected companions form an idle group")
	var idle_position: Vector2 = sokka.position
	await frames(6)
	check(sokka.position == idle_position and not sokka.player_controlled,"Unselected group stays idle")
	check(String(sokka.sprite.animation).begins_with("idle_") and sokka.velocity == Vector2.ZERO,"Left-behind characters adopt idle stance instead of freezing a walking pose")
	key(ui,KEY_E)
	key(ui,KEY_TAB)
	check(manager.active_group().members[ui.viewed_index] == aang,"Inventory carousel restricted to active group")
	key(ui,KEY_TAB)
	check(ui.viewed_index == 0,"Two-member inventory carousel wraps locally")
	key(ui,KEY_ESCAPE)
	manager.select_next_group()
	while manager.active_group().members[0] != sokka:
		manager.rotate_leader()
	check(manager.split_selected([&"sokka"]),"Inactive group can become selected and split again")
	manager.active_index = 2
	manager.refresh_control()
	while manager.active_group().members[0] != toph:
		manager.rotate_leader()
	check(manager.split_selected([&"toph"]),"Four independent groups supported")
	check(manager.groups.size() == 4 and not manager.split_selected([&"toph"]),"Four-group limit enforced without changing membership")
	check(not manager.full_party_present(),"Full-party event rejects separated roster")
	var owners: Dictionary = {}
	for group in manager.groups:
		for actor in group.members:
			owners[actor.character_id] = int(owners.get(actor.character_id,0)) + 1
	check(owners.size() == 5 and owners.values().all(func(value): return value == 1),"Splitting preserves exactly one owner group per character")
	manager.active_index = 0
	manager.refresh_control()
	katara.position = Vector2(160,224)
	aang.position = Vector2(160,252)
	sokka.position = Vector2(420,224)
	toph.position = Vector2(440,256)
	zuko.position = Vector2(420,284)
	for group in manager.groups:
		group.reset_route()
	scene.toggle_gate()
	await frames(2)
	manager.request_regroup()
	check(manager.returning.is_empty() and manager.groups.size() == 4,"Closed gate rejects unreachable regroup without teleporting")
	check(sokka.position.x > 336,"Blocked companion remains on far side")
	scene.toggle_gate()
	await frames(2)
	manager.request_regroup()
	check(manager.returning.size() == 3,"Open passage starts all three inactive groups returning")
	manager.select_next_group()
	check(manager.returning.is_empty(),"Switching groups cancels return movement")
	manager.active_index = 0
	manager.refresh_control()
	manager.request_regroup()
	await frames(600)
	if manager.groups.size() != 1:
		for group in manager.groups:
			print("REGROUP DEBUG ",group.members.map(func(actor): return [actor.name,actor.position])," returning=",manager.returning.has(group))
		print("REGROUP MESSAGE ",manager.message)
	check(manager.groups.size() == 1 and manager.full_party_present(),"Reachable companions physically walk back and merge")
	check(sokka.position.x < 304 and toph.position.x < 304 and zuko.position.x < 304,"All returning actors actually crossed open gate")
	var fish = katara.inventory.on_person[0]
	check(katara.inventory.transfer_to("on_person",0,aang.inventory,"backpack",0,8),"Half-stack transfer between members succeeds")
	check(fish.quantity == 7 and aang.inventory.backpack[0].quantity == 8,"Transfer conserves quantity")
	check(not sokka.inventory.transfer_to("on_person",0,katara.inventory,"on_person",0,1),"Personal club cannot transfer to another character")
	check(sokka.inventory.equip_weapon("on_person",0),"Sokka equips club from on-person storage")
	sokka.refresh_weapon()
	check(sokka.inventory.on_person[0] == null and sokka.inventory.weapon.item.item_id == "sokkas_club" and sokka.weapon_visual.visible,"Equipped item is removed from storage and appears in hand")
	check(not katara.inventory.equip_weapon("backpack",0),"Food cannot occupy weapon slot")
	for group_index in range(manager.groups.size()):
		if manager.groups[group_index].members.has(sokka):
			manager.active_index = group_index
			manager.refresh_control()
	while manager.active_group().members[0] != sokka:
		manager.rotate_leader()
	sokka.position = Vector2(180,220)
	for actor in manager.roster:
		if actor != sokka:
			actor.position = Vector2(100,300 + manager.roster.find(actor)*18)
	manager.active_group().reset_route()
	await frames(2)
	var target = get_nodes_in_group("sandbox_hit_targets")[0]
	check(sokka.start_attack(Vector2.RIGHT),"Equipped attack starts")
	check(not sokka.start_attack(Vector2.RIGHT),"Attack cannot stack during windup/recovery")
	key(ui,KEY_E)
	var elapsed: float = sokka.attack_elapsed
	await create_timer(0.1,true,false,true).timeout
	check(sokka.attack_elapsed == elapsed and target.hit_count == 0,"Inventory pauses in-progress attack before impact")
	key(ui,KEY_ESCAPE)
	await frames(40)
	check(target.hit_count == 1 and target.health == 10,"One swing applies exactly one hit, not damage every frame")
	sokka.start_attack(Vector2.RIGHT)
	await frames(40)
	check(target.broken and target.health == 0 and target.hit_count == 2,"Two valid hits break the crate")
	sokka.start_attack(Vector2.RIGHT)
	await frames(40)
	check(target.hit_count == 2,"Broken object does not receive repeated hits")
	# A closed gate blocks a hit even with deliberately exaggerated test reach.
	var distant = get_nodes_in_group("sandbox_hit_targets")[1]
	sokka.position = Vector2(280,220)
	distant.position = Vector2(360,220)
	scene.toggle_gate()
	await frames(2)
	var definition = sokka.weapon_definition.duplicate()
	definition.reach = 120.0
	scene.resolve_attack(sokka,definition,Vector2.RIGHT)
	check(distant.hit_count == 0,"World collision occludes attacks through closed gate")
	for section in [sokka.inventory.on_person,sokka.inventory.backpack]:
		for i in range(section.size()):
			section[i] = ItemStack.new(load("res://Items/fish1.tres"),20)
	check(not sokka.inventory.unequip_weapon() and sokka.inventory.weapon != null,"Full inventory cannot lose equipped weapon on unequip")
	var old_timer: float = aang.concentration_remaining
	aang.concentration_remaining = 0.02
	await frames(4)
	check(aang.concentration_remaining == 0,"Inactive character concentration expires")
	aang.concentration_remaining = old_timer
	print("SANDBOX TESTS: %d checks, %d failures" % [checks,failures])
	quit(0 if failures == 0 else 1)
