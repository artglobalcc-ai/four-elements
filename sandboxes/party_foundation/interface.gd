extends CanvasLayer

var manager: Node
var world: Node
var status: Label
var panel: PanelContainer
var content: VBoxContainer
var modal: String = ""
var viewed_index: int = 0
var chosen: Dictionary = {}
const Cursor = preload("res://sandboxes/party_foundation/inventory_cursor.gd")
var cursor = Cursor.new()
var cursor_icon: TextureRect
var cursor_count: Label
var storage_view: String = "on_person"
var storage_buttons: Dictionary = {}
var inventory_background: TextureRect
var storage_scroll: ScrollContainer
var storage_grid: GridContainer
var storage_scroll_key: String = ""
var storage_scroll_offsets: Dictionary = {}
const SKINS = {
	&"katara": preload("res://UI/Inventory/Artwork/inventory_water.png"),
	&"sokka": preload("res://UI/Inventory/Artwork/inventory_standard.png"),
	&"aang": preload("res://UI/Inventory/Artwork/inventory_air.png"),
	&"toph": preload("res://UI/Inventory/Artwork/inventory_earth.png"),
	&"zuko": preload("res://UI/Inventory/Artwork/inventory_fire.png")
}
var t_held: float = -1.0
var regroup_sent: bool = false
var details: Label
const HUD_SCALE := 0.75
var feedback_panel: PanelContainer
var hud: PanelContainer
var hud_name: Label
var hud_technique: Label
var hud_portrait: TextureRect
var concentration_bar: ProgressBar
var party_strip: Control
var party_signature: String = ""
var feedback_age: float = 0.0
var previous_message: String = ""
var bag_page: int = 0
var bag_category: String = "All"
var item_name_label: Label
var item_description_label: Label
var slot_buttons: Dictionary = {}
var quick_button: Button
var hotbar_buttons: Array[Button] = []
var hotbar_icons: Array[TextureRect] = []
var hotbar_counts: Array[Label] = []
var hotbar_idle_style: StyleBoxFlat
var hotbar_selected_style: StyleBoxFlat
var weapon_button: Button
var inventory_canvas: Control
const INK := Color("233e4d")
const PAPER := Color("e4d7b7")
const EDGE := Color("628b98")
const GOLD := Color("d3aa60")

func box(color: Color, border: Color = EDGE) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = color
	style.border_color = border
	style.set_border_width_all(1)
	style.content_margin_left = 3
	style.content_margin_right = 3
	style.content_margin_top = 2
	style.content_margin_bottom = 2
	return style

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	var theme := Theme.new()
	theme.default_font_size = 8
	theme.set_color("font_color", "Label", INK)
	theme.set_color("font_color", "Button", INK)
	theme.set_color("font_hover_color", "Button", INK)
	theme.set_color("font_pressed_color", "Button", INK)
	theme.set_stylebox("normal", "Button", box(Color("d5c8a9")))
	theme.set_stylebox("hover", "Button", box(Color("f4e7c8"), GOLD))
	theme.set_stylebox("pressed", "Button", box(Color("abcbd1"), GOLD))
	theme.set_stylebox("disabled", "Button", box(Color("a9b5ae")))
	theme.set_constant("separation", "VBoxContainer", 2)
	var root := Control.new()
	root.theme = theme
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(root)
	party_strip = Control.new()
	party_strip.position = Vector2(4, 4)
	party_strip.size = Vector2(292, 23)
	party_strip.mouse_filter = Control.MOUSE_FILTER_IGNORE
	root.add_child(party_strip)
	var feedback := PanelContainer.new()
	feedback_panel = feedback
	feedback.position = Vector2(4, 135)
	feedback.size = Vector2(292, 22)
	feedback.mouse_filter = Control.MOUSE_FILTER_IGNORE
	feedback.add_theme_stylebox_override("panel", box(Color(0.9, 0.86, 0.74, 0.94)))
	root.add_child(feedback)
	status = Label.new()
	status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	status.clip_text = true
	status.custom_minimum_size = Vector2(284,18)
	status.add_theme_font_size_override("font_size", 8)
	feedback.add_child(status)
	hud = PanelContainer.new()
	hud.position = Vector2(4, 160)
	hud.size = Vector2(292, 36)
	hud.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_theme_stylebox_override("panel", box(Color("d5e1dc")))
	root.add_child(hud)
	var hud_canvas := Control.new()
	hud_canvas.custom_minimum_size = Vector2(284,30)
	hud_canvas.mouse_filter = Control.MOUSE_FILTER_IGNORE
	hud.add_child(hud_canvas)
	hud_portrait = picture(hud_canvas, Vector2(1,0), Vector2(27,30), null)
	hud_name = caption(hud_canvas, "", Vector2(33,0), Vector2(55,12), 9)
	concentration_bar = ProgressBar.new()
	concentration_bar.position = Vector2(33,15)
	concentration_bar.size = Vector2(55,5)
	concentration_bar.show_percentage = false
	concentration_bar.max_value = 45
	concentration_bar.mouse_filter = Control.MOUSE_FILTER_IGNORE
	concentration_bar.add_theme_stylebox_override("background", box(Color("78939a")))
	concentration_bar.add_theme_stylebox_override("fill", box(Color("3ba8d4"), Color("206d9c")))
	hud_canvas.add_child(concentration_bar)
	hud_technique = caption(hud_canvas, "", Vector2(33,21), Vector2(55,10), 7)
	hotbar_idle_style = box(Color("c4d1cb"),EDGE)
	hotbar_selected_style = box(Color("a8cbd2"),GOLD)
	for i in range(6):
		var index: int = i
		var slot := small_button(hud_canvas,"",Vector2(91+i*24,3),Vector2(22,25),func(): activate_quick_slot(index))
		caption(slot,str(i+1),Vector2(1,0),Vector2(8,8),6)
		hotbar_icons.append(picture(slot,Vector2(3,7),Vector2(16,15),null))
		hotbar_counts.append(caption(slot,"",Vector2(10,17),Vector2(12,8),6))
		hotbar_buttons.append(slot)
	quick_button = hotbar_buttons[0]
	small_button(hud_canvas,"E",Vector2(239,3),Vector2(19,25),func(): viewed_index = 0; open_modal("inventory"); show_inventory()).tooltip_text = "Inventory"
	small_button(hud_canvas,"T",Vector2(262,3),Vector2(20,25),open_split).tooltip_text = "Split party"
	panel = PanelContainer.new()
	panel.position = Vector2(20,17)
	panel.size = Vector2(260,166)
	panel.add_theme_stylebox_override("panel", box(PAPER, EDGE))
	root.add_child(panel)
	var scroll := ScrollContainer.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	panel.add_child(scroll)
	content = VBoxContainer.new()
	content.custom_minimum_size.x = 250
	scroll.add_child(content)
	panel.hide()
	cursor_icon = picture(root,Vector2.ZERO,Vector2(17,17),null)
	cursor_icon.z_index = 100
	cursor_count = caption(cursor_icon,"",Vector2(6,10),Vector2(15,10),8)
	cursor_count.add_theme_color_override("font_color",Color.WHITE)
	cursor_count.add_theme_color_override("font_shadow_color",Color.BLACK)
	cursor_icon.hide()
	party_strip.scale = Vector2.ONE * HUD_SCALE
	hud.scale = Vector2.ONE * HUD_SCALE
	feedback_panel.scale = Vector2.ONE * HUD_SCALE
	layout_gameplay_hud.call_deferred()

func layout_gameplay_hud() -> void:
	var viewport_size := get_viewport().get_visible_rect().size
	party_strip.position = Vector2(4, 4)
	hud.position = Vector2(4, viewport_size.y - 4 - hud.size.y * HUD_SCALE)
	feedback_panel.position = Vector2(4, hud.position.y - 3 - feedback_panel.size.y * HUD_SCALE)

func _process(delta: float) -> void:
	layout_gameplay_hud()
	refresh_cursor()
	var group = manager.active_group()
	var leader = group.members[0]
	hud_portrait.texture = portrait(leader)
	hud_name.text = leader.name
	concentration_bar.value = leader.concentration_remaining
	hud_technique.text = "Water %.0fs" % leader.concentration_remaining if leader.concentration_remaining > 0 else "Ready"
	for i in range(6):
		var stack: ItemStack = leader.inventory.quick_slots[i]
		hotbar_icons[i].texture = stack.item.icon if stack != null else null
		hotbar_counts[i].text = str(stack.quantity) if stack != null and stack.quantity > 1 else ""
		var active: bool = leader.inventory.selected_quick_slot == i
		var modes: Dictionary = world.bending_modes.get(leader.character_id,{})
		if stack == null and modes.has(i):
			hotbar_buttons[i].text = "~" if i==0 else (">" if i==1 else "P")
			hotbar_buttons[i].tooltip_text = "%d: %s" % [i+1,modes[i].definition.display_name]
			active = world.current_bending(leader)==modes[i] and modes[i].selected
		else:
			hotbar_buttons[i].text = ""
			hotbar_buttons[i].tooltip_text = "%d: %s" % [i+1,stack.item.item_name if stack != null else "Empty"]
		hotbar_buttons[i].add_theme_stylebox_override("normal",hotbar_selected_style if active else hotbar_idle_style)
	var signature: String = str(manager.active_index) + str(group.members.map(func(actor): return actor.character_id))
	if signature != party_signature:
		party_signature = signature
		refresh_party_strip()
	if manager.message != previous_message:
		previous_message = manager.message
		feedback_age = 0.0
	if modal.is_empty():
		feedback_age += delta
	status.text = manager.message
	status.tooltip_text = manager.message
	status.get_parent().visible = modal.is_empty() and feedback_age < 7.0
	if t_held >= 0 and modal.is_empty():
		t_held += delta
		if t_held >= 0.55 and not regroup_sent:
			regroup_sent = true
			manager.request_regroup()

func portrait(actor: Node) -> Texture2D:
	return actor.sprite.sprite_frames.get_frame_texture("idle_down",0)

func picture(parent: Control, position: Vector2, size: Vector2, texture: Texture2D) -> TextureRect:
	var image := TextureRect.new()
	image.position = position
	image.size = size
	image.texture = texture
	image.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	image.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	image.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	image.mouse_filter = Control.MOUSE_FILTER_IGNORE
	parent.add_child(image)
	return image

func caption(parent: Control, value: String, position: Vector2, size: Vector2, font_size: int = 8) -> Label:
	var label := Label.new()
	label.text = value
	label.position = position
	label.size = size
	label.clip_text = true
	label.mouse_filter = Control.MOUSE_FILTER_IGNORE
	label.add_theme_font_size_override("font_size", font_size)
	parent.add_child(label)
	return label

func small_button(parent: Control, title: String, position: Vector2, size: Vector2, callback: Callable) -> Button:
	var result := Button.new()
	result.text = title
	result.position = position
	result.size = size
	result.focus_mode = Control.FOCUS_NONE
	result.pressed.connect(callback)
	parent.add_child(result)
	return result

func refresh_party_strip() -> void:
	for child in party_strip.get_children():
		party_strip.remove_child(child)
		child.queue_free()
	var backing := ColorRect.new()
	backing.size = Vector2(292,25)
	backing.color = Color(0.83,0.9,0.88,0.94)
	backing.mouse_filter = Control.MOUSE_FILTER_IGNORE
	party_strip.add_child(backing)
	var group = manager.active_group()
	for i in range(group.members.size()):
		var tile := PanelContainer.new()
		tile.position = Vector2(i*24,0)
		tile.size = Vector2(21,23)
		tile.mouse_filter = Control.MOUSE_FILTER_IGNORE
		tile.add_theme_stylebox_override("panel",box(Color("e4d7b7"), GOLD if i == 0 else EDGE))
		party_strip.add_child(tile)
		var image := picture(tile,Vector2.ZERO,Vector2(16,18),portrait(group.members[i]))
		image.modulate = group.members[i].sprite.modulate
	caption(party_strip,"Group %d/%d  R switch" % [manager.active_index+1,manager.groups.size()],Vector2(130,2),Vector2(157,12))
	caption(party_strip,"Tab leader  |  T split / hold to regroup",Vector2(130,13),Vector2(157,10),7)

func _input(event: InputEvent) -> void:
	if not event is InputEventKey or event.echo:
		return
	if event.is_action("split_group"):
		if modal.is_empty():
			if event.pressed:
				t_held = 0.0
				regroup_sent = false
			else:
				var should_split: bool = t_held >= 0 and not regroup_sent
				t_held = -1.0
				if should_split:
					open_split()
		get_viewport().set_input_as_handled()
		return
	if not event.pressed:
		return
	if modal == "inventory":
		if event.is_action("switch_character"):
			viewed_index = (viewed_index + 1) % manager.active_group().members.size()
			show_inventory()
		elif event.keycode in [KEY_E,KEY_ESCAPE]:
			close_modal()
		get_viewport().set_input_as_handled()
		return
	if modal == "split":
		if event.keycode == KEY_ESCAPE:
			close_modal()
		get_viewport().set_input_as_handled()
		return
	if event.keycode == KEY_E:
		viewed_index = 0
		open_modal("inventory")
		show_inventory()
	elif event.is_action("switch_character"):
		manager.rotate_leader()
	elif event.is_action("cycle_group"):
		manager.select_next_group()
	elif event.keycode == KEY_B:
		manager.message = "Press 1 to select your bending, then click its matching test object."
	elif event.keycode >= KEY_1 and event.keycode <= KEY_6:
		activate_quick_slot(int(event.keycode-KEY_1))
	elif event.keycode == KEY_F:
		world.toggle_gate()
	elif event.keycode == KEY_ENTER:
		var leader = manager.active_group().members[0]
		if leader.global_position.distance_to(Vector2(520,220)) > 35:
			manager.message = "Walk onto the gold event pad on the east side."
		else:
			manager.message = "Full-party event accepted." if manager.full_party_present() else "This event needs everyone. Rejoin all groups first."
	else:
		return
	get_viewport().set_input_as_handled()

func activate_quick_slot(index: int) -> void:
	if not modal.is_empty():
		return
	var actor = manager.active_group().members[0]
	actor.inventory.select_quick_slot(index)
	actor.refresh_weapon()
	var stack: ItemStack = actor.inventory.quick_slots[index]
	var modes: Dictionary = world.bending_modes.get(actor.character_id,{})
	if stack == null and modes.has(index):
		var previous: Node = world.current_bending(actor)
		if previous != modes[index] and previous != world.water:
			previous.cancel()
		world.active_bending_modes[actor.character_id] = modes[index]
		modes[index].select_technique(actor)
	elif stack != null:
		manager.message = "%s selected: %s" % [actor.name,stack.item.item_name]
	else:
		manager.message = "Quickslot %d is empty." % [index+1]

func _unhandled_input(event: InputEvent) -> void:
	if modal.is_empty() and event is InputEventMouseButton and event.pressed:
		var actor = manager.active_group().members[0]
		if event.button_index == MOUSE_BUTTON_RIGHT and actor.bending != null:
			world.current_bending(actor).cancel()
		elif event.button_index == MOUSE_BUTTON_LEFT:
			if actor.bending != null and world.current_bending(actor).selected:
				world.current_bending(actor).click_at(actor, world.get_global_mouse_position())
			elif not actor.start_attack(world.get_global_mouse_position() - actor.global_position):
				manager.message = "Benders: press 1 to select bending. Sokka: equip the club before attacking."
		else:
			return
		get_viewport().set_input_as_handled()

func open_modal(kind: String) -> void:
	t_held = -1.0
	modal = kind
	if kind == "inventory":
		panel.position = Vector2(3,10)
		panel.size = Vector2(294,180)
		content.custom_minimum_size.x = 288
		panel.add_theme_stylebox_override("panel",box(Color("101a24"),Color("7e9ba6")))
	else:
		panel.add_theme_stylebox_override("panel",box(PAPER,EDGE))
		panel.position = Vector2(5,5)
		panel.size = Vector2(290,190)
		content.custom_minimum_size.x = 275
	get_tree().paused = true
	status.get_parent().hide()
	hud.hide()
	party_strip.hide()
	panel.show()

func close_modal() -> void:
	if not cursor.return_home():
		if is_instance_valid(item_description_label):
			item_description_label.text = cursor.message
		return
	refresh_equipped_weapons()
	modal = ""
	panel.hide()
	cursor_icon.hide()
	status.get_parent().show()
	hud.show()
	party_strip.show()
	get_tree().paused = false

func refresh_cursor() -> void:
	if cursor_icon == null:
		return
	cursor_icon.visible = modal == "inventory" and cursor.stack != null
	if cursor.stack != null:
		cursor_icon.texture = cursor.stack.item.icon
		cursor_count.text = str(cursor.stack.quantity) if cursor.stack.quantity > 1 else ""
		cursor_icon.position = get_viewport().get_mouse_position() - Vector2(8,8)

func refresh_equipped_weapons() -> void:
	for actor in manager.roster:
		actor.refresh_weapon()

func clear_content() -> void:
	for child in content.get_children():
		content.remove_child(child)
		child.queue_free()

func text(value: String) -> Label:
	var label := Label.new()
	label.text = value
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	content.add_child(label)
	return label

func button(title: String, callback: Callable) -> Button:
	var result := Button.new()
	result.text = title
	result.focus_mode = Control.FOCUS_NONE
	result.pressed.connect(callback)
	content.add_child(result)
	return result

func open_split() -> void:
	if manager.group_is_jumping():
		manager.message = "Land before splitting the party."
		return
	if manager.groups.size() >= 4:
		manager.message = "Four groups maximum. Hold T to regroup first."
		return
	if manager.active_group().members.size() < 2:
		manager.message = "A solo character cannot split further."
		return
	open_modal("split")
	clear_content()
	chosen.clear()
	text("SPLIT GROUP — keep checked characters with the leader")
	text("Unchecked characters form one idle group. World paused.")
	var choices := GridContainer.new()
	choices.columns = 2
	content.add_child(choices)
	for actor in manager.active_group().members:
		var id: StringName = actor.character_id
		var checkbox := CheckBox.new()
		checkbox.text = actor.name
		checkbox.focus_mode = Control.FOCUS_NONE
		checkbox.button_pressed = true
		chosen[id] = true
		checkbox.disabled = actor == manager.active_group().members[0]
		checkbox.toggled.connect(func(value: bool): chosen[id] = value)
		choices.add_child(checkbox)
	details = text("")
	button("Confirm split",confirm_split)
	button("Cancel / Esc",close_modal)

func confirm_split() -> void:
	var ids: Array = []
	for id in chosen:
		if chosen[id]:
			ids.append(id)
	if manager.split_selected(ids):
		close_modal()
	else:
		details.text = manager.message

func show_inventory() -> void:
	if is_instance_valid(storage_scroll):
		storage_scroll_offsets[storage_scroll_key] = storage_scroll.scroll_vertical
	storage_scroll = null
	storage_grid = null
	clear_content()
	slot_buttons.clear()
	storage_buttons.clear()
	var actor = manager.active_group().members[viewed_index]
	inventory_canvas = Control.new()
	inventory_canvas.custom_minimum_size = Vector2(288,174)
	content.add_child(inventory_canvas)
	inventory_background = picture(inventory_canvas,Vector2(0,14),Vector2(250,141),SKINS.get(actor.character_id))
	var name_label := caption(inventory_canvas,actor.name,Vector2(2,0),Vector2(140,12),9)
	name_label.add_theme_color_override("font_color",Color("e8e9dc"))
	var image := picture(inventory_canvas,Vector2(46,53),Vector2(35,57),portrait(actor))
	image.modulate = actor.sprite.modulate
	weapon_button = make_slot(inventory_canvas,actor,"weapon",0,Vector2(90,48),actor.inventory.weapon,Vector2(22,22))
	weapon_button.pressed.connect(_slot_clicked.bind(actor,"weapon",0,false))
	weapon_button.gui_input.connect(_slot_gui.bind(actor,"weapon",0))
	weapon_button.tooltip_text = "Weapon: place a compatible item here to equip; click to pick it up"
	var weapon_label := caption(inventory_canvas,"Weapon",Vector2(87,38),Vector2(29,9),6)
	weapon_label.add_theme_color_override("font_color",Color("e5e5d2"))
	var indices: Array[int] = []
	if storage_view == "on_person":
		for i in range(actor.inventory.on_person.size()):
			indices.append(i)
	elif storage_view == "backpack":
		indices = backpack_indices(actor)
	if storage_view == "on_person":
		# Preserve the supplied Carry layout. Only the larger bags use the inset scroller.
		for display_index in range(indices.size()):
			var actual_index: int = indices[display_index]
			var stack: ItemStack = actor.inventory.get_stack("on_person",actual_index)
			var slot := make_slot(inventory_canvas,actor,"on_person",actual_index,Vector2(133+(display_index%4)*27,53+(display_index/4)*26),stack,Vector2(22,22))
			slot.pressed.connect(_slot_clicked.bind(actor,"on_person",actual_index,false))
			slot.gui_input.connect(_slot_gui.bind(actor,"on_person",actual_index))
	elif storage_view == "moves":
		build_moves_placeholder()
	else:
		build_storage_scroll(actor,indices)
	for i in range(actor.inventory.quick_slots.size()):
		var slot := make_slot(inventory_canvas,actor,"quick",i,Vector2(132+i*17.6,115),actor.inventory.quick_slots[i],Vector2(15,16))
		slot.pressed.connect(_slot_clicked.bind(actor,"quick",i,false))
		slot.gui_input.connect(_slot_gui.bind(actor,"quick",i))
	var choices: Array = [["Carry","on_person","All"],["Moves","moves","All"],["Pack","backpack","All"],["Food","backpack","Food"],["Gear","backpack","Gear"],["Other","backpack","Other"]]
	for i in range(choices.size()):
		var choice: Array = choices[i]
		var selector := small_button(inventory_canvas,choice[0],Vector2(253,22+i*19),Vector2(34,16),func(): storage_view=choice[1]; bag_category=choice[2]; bag_page=0; show_inventory())
		storage_buttons[choice[0]] = selector
		if storage_view==choice[1] and bag_category==choice[2]:
			selector.add_theme_stylebox_override("normal",box(Color("aac6ce"),GOLD))
	small_button(inventory_canvas,"Close",Vector2(253,149),Vector2(34,14),close_modal)
	item_name_label = caption(inventory_canvas,"On person" if storage_view=="on_person" else "Backpack / "+bag_category,Vector2(1,157),Vector2(220,10),8)
	if storage_view == "moves":
		item_name_label.text = "Combat moveset"
	item_name_label.add_theme_color_override("font_color",Color("e5e5d2"))
	item_description_label = caption(inventory_canvas,"Click to pick up / place. Right-click half / one.",Vector2(1,167),Vector2(285,9),7)
	if storage_view == "moves":
		item_description_label.text = "4 active moves initially; expands to 8. Separate from quickslots."
	item_description_label.add_theme_color_override("font_color",Color("c6d4da"))
	details = item_description_label
	if cursor.stack != null:
		item_name_label.text = cursor.stack.item.item_name + " (held)"
	panel.set_deferred("size",Vector2(294,180))
	refresh_cursor()

func build_moves_placeholder() -> void:
	var interior := ColorRect.new()
	interior.position = Vector2(131,50)
	interior.size = Vector2(111,55)
	interior.color = Color("101b25")
	interior.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inventory_canvas.add_child(interior)
	var title := caption(inventory_canvas,"Moveset manager",Vector2(133,51),Vector2(107,10),8)
	title.add_theme_color_override("font_color",Color("e5e5d2"))
	for i in range(4):
		var slot := small_button(inventory_canvas,str(i+1),Vector2(133+i*27,64),Vector2(23,19),func(): pass)
		slot.disabled = true
		slot.tooltip_text = "Combat move slot — manager coming later"
	var note := caption(inventory_canvas,"Coming later",Vector2(133,88),Vector2(107,10),7)
	note.add_theme_color_override("font_color",Color("c6d4da"))

func build_storage_scroll(actor: Node, indices: Array[int]) -> void:
	# Cover only the old slot interiors. Source artwork, outer frame and hotbar remain intact.
	var interior := ColorRect.new()
	interior.position = Vector2(131,50)
	interior.size = Vector2(111,55)
	interior.color = Color("101b25")
	interior.mouse_filter = Control.MOUSE_FILTER_IGNORE
	inventory_canvas.add_child(interior)
	storage_scroll = ScrollContainer.new()
	storage_scroll.position = Vector2(132,51)
	storage_scroll.size = Vector2(109,53)
	storage_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	storage_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	storage_scroll.follow_focus = false
	inventory_canvas.add_child(storage_scroll)
	var bar: VScrollBar = storage_scroll.get_v_scroll_bar()
	var track := box(Color("172a35"),Color("4f6672"))
	track.set_content_margin_all(1)
	bar.add_theme_stylebox_override("scroll",track)
	bar.add_theme_stylebox_override("grabber",box(Color("91a9af"),Color("c9c0a0")))
	bar.add_theme_stylebox_override("grabber_highlight",box(Color("b6d0d3"),GOLD))
	bar.add_theme_stylebox_override("grabber_pressed",box(Color("b6d0d3"),GOLD))
	storage_grid = GridContainer.new()
	storage_grid.columns = 4
	storage_grid.add_theme_constant_override("h_separation",2)
	storage_grid.add_theme_constant_override("v_separation",2)
	storage_scroll.add_child(storage_grid)
	var visible_cells: int = maxi(12,ceili(indices.size()/4.0)*4)
	for cell in range(visible_cells):
		var index: int = indices[cell] if cell < indices.size() else -1
		var stack: ItemStack = actor.inventory.get_stack("backpack",index) if index >= 0 else null
		var slot := make_slot(storage_grid,actor,"backpack",index,Vector2.ZERO,stack,Vector2(23,16))
		slot.custom_minimum_size = Vector2(23,16)
		slot.add_theme_stylebox_override("normal",box(Color("15232d"),Color("998260")))
		if index >= 0:
			slot.pressed.connect(_slot_clicked.bind(actor,"backpack",index,false))
			slot.gui_input.connect(_slot_gui.bind(actor,"backpack",index))
		else:
			slot.disabled = true
	storage_scroll_key = String(actor.character_id)+":"+bag_category
	storage_scroll.set_deferred("scroll_vertical",int(storage_scroll_offsets.get(storage_scroll_key,0)))

func backpack_indices(actor: Node) -> Array[int]:
	actor.inventory.ensure_backpack_space()
	var result: Array[int] = []
	for i in range(actor.inventory.backpack_visible_slots):
		var stack: ItemStack = actor.inventory.backpack[i]
		var matches: bool = bag_category == "All" or stack == null
		if stack != null:
			var category: int = stack.item.category
			if bag_category == "Food":
				matches = category == ItemData.ItemCategory.FOOD
			elif bag_category == "Gear":
				matches = category in [ItemData.ItemCategory.WEAPON,ItemData.ItemCategory.TOOL,ItemData.ItemCategory.ARMOR,ItemData.ItemCategory.TRINKET]
			elif bag_category == "Other":
				matches = category not in [ItemData.ItemCategory.FOOD,ItemData.ItemCategory.WEAPON,ItemData.ItemCategory.TOOL,ItemData.ItemCategory.ARMOR,ItemData.ItemCategory.TRINKET]
		if matches:
			result.append(i)
	# Filtering changes only presentation. Empty slots remain usable for transfers.
	return result

func make_slot(parent: Control, actor: Node, section: String, index: int, position: Vector2, stack: ItemStack, slot_size: Vector2 = Vector2(22,22)) -> Button:
	var slot := small_button(parent,"",position,slot_size,func(): pass)
	slot.add_theme_stylebox_override("normal",StyleBoxEmpty.new())
	slot.add_theme_stylebox_override("hover",box(Color(0.4,0.7,0.8,0.25),GOLD))
	slot.add_theme_stylebox_override("pressed",box(Color(0.4,0.7,0.8,0.4),GOLD))
	if stack != null:
		var icon_size: Vector2 = slot_size - Vector2(4,4)
		picture(slot,Vector2(2,2),icon_size,stack.item.icon)
		var count := caption(slot,str(stack.quantity) if stack.quantity>1 else "",Vector2(4,slot_size.y-9),Vector2(slot_size.x-5,9),7)
		count.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
		count.add_theme_color_override("font_color",Color.WHITE)
		count.add_theme_color_override("font_shadow_color",Color.BLACK)
		slot.tooltip_text = stack.item.item_name + " — " + stack.item.description
		slot.mouse_entered.connect(func():
			if is_instance_valid(item_name_label):
				item_name_label.text=stack.item.item_name
				item_description_label.text=stack.item.description)
	slot_buttons[section+":"+str(index)] = slot
	return slot

func _slot_gui(event: InputEvent, actor: Node, section: String, index: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		_slot_clicked(actor,section,index,true)
		get_viewport().set_input_as_handled()

func _slot_clicked(actor: Node, section: String, index: int, right_click: bool) -> void:
	if not manager.active_group().members.has(actor):
		return
	var success: bool
	if cursor.stack == null:
		success = cursor.take(actor.inventory,section,index,right_click)
	else:
		# Party/group switching is blocked while inventory is open. Tab retains held items.
		success = cursor.place(actor.inventory,section,index,right_click)
	refresh_equipped_weapons()
	if success:
		show_inventory()
	else:
		if is_instance_valid(item_description_label):
			item_description_label.text = cursor.message
		refresh_cursor()
