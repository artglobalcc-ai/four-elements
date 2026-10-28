extends "res://scripts/movement scripts/character_controller.gd"

var world: Node
var ground_height: float = 0.0
var world_height: float = 0.0
var jump_from := Vector2.ZERO
var jump_to := Vector2.ZERO
var jump_from_height: float = 0.0
var jump_to_height: float = 0.0
var last_jump_succeeded: bool = true
const FOOT_RADIUS: float = 5.0
const BODY_HEIGHT: float = 24.0
static var frame_bounds: Dictionary = {}
signal jump_finished(trace: Array)
var jump_trace: Array = []
var replay_trace: Array = []
var replay_index: int = 0
var replay_offset := Vector2.ZERO
var replay_height_offset: float = 0.0
var replay_distance: float = 0.0
var last_safe_jump_position := Vector2.ZERO
var last_safe_jump_height: float = 0.0
var stationary_jump: bool = false
var visuals: Node2D
var character_id: StringName
var inventory: RefCounted
var concentration_remaining: float = 0.0
var concentration_limit: float = 45.0
var group_number: int = 1
signal attack_impact(actor: Node, definition: Resource, direction: Vector2)
var weapon_definition: Resource
var weapon_socket: Node2D
var weapon_visual: Sprite2D
var attacking: bool = false
var attack_elapsed: float = 0.0
var attack_direction: Vector2 = Vector2.DOWN
var hit_emitted: bool = false
signal formation_slot_changed(displacement: Vector2)
var bending: Node

func enter_idle() -> void:
	velocity = Vector2.ZERO
	if is_jumping:
		finish_jump()
	if not attacking:
		sprite.rotation = 0.0
		play_animation("idle_" + facing_direction)

func set_player_controlled(value: bool) -> void:
	super.set_player_controlled(value)
	if not value:
		enter_idle()

func _ready() -> void:
	super._ready()
	visuals = Node2D.new()
	visuals.name = "HeightVisuals"
	add_child(visuals)
	for child in get_children():
		if child is AnimatedSprite2D or child is Label:
			child.reparent(visuals)
	# Normalize source-sheet padding at runtime; source artwork remains untouched.
	var idle_texture: Texture2D = sprite.sprite_frames.get_frame_texture("idle_down",0)
	var idle_bounds: Rect2i = visible_frame_bounds(idle_texture)
	sprite.scale = Vector2.ONE*BODY_HEIGHT/maxf(1,idle_bounds.size.y)
	for child in get_children():
		if child is CollisionShape2D:
			var shape := CircleShape2D.new()
			shape.radius = FOOT_RADIUS
			child.shape = shape
			child.position = Vector2.ZERO
	sprite.frame_changed.connect(align_sprite_feet)
	sprite.animation_changed.connect(align_sprite_feet)
	align_sprite_feet()
	set_ground_height(0.0)
	weapon_socket = Node2D.new()
	weapon_socket.name = "WeaponSocket"
	visuals.add_child(weapon_socket)
	weapon_visual = Sprite2D.new()
	weapon_visual.name = "WeaponVisual"
	weapon_socket.add_child(weapon_visual)
	refresh_weapon()

func refresh_weapon() -> void:
	if weapon_visual == null:
		return
	weapon_visual.visible = inventory.weapon != null
	if inventory.weapon != null:
		weapon_visual.texture = inventory.weapon.item.icon
		var dimension: float = maxf(weapon_visual.texture.get_width(),weapon_visual.texture.get_height())
		weapon_visual.scale = Vector2.ONE * 22.0 / dimension
		weapon_visual.position = Vector2(0,-8)
	weapon_socket.position = Vector2(9,-10)
	weapon_socket.z_index = 2

func facing_vector() -> Vector2:
	var axes := {"up":Vector2.UP,"down":Vector2.DOWN,"left":Vector2.LEFT,"right":Vector2.RIGHT,
		"up_left":Vector2(-1,-1),"up_right":Vector2(1,-1),"down_left":Vector2(-1,1),"down_right":Vector2(1,1)}
	return axes.get(facing_direction,Vector2.DOWN).normalized()

func start_attack(direction: Vector2) -> bool:
	if attacking or is_jumping or inventory.weapon == null or weapon_definition == null:
		return false
	attack_direction = direction.normalized() if direction.length_squared() > 0.01 else facing_vector()
	facing_direction = get_direction_name(attack_direction)
	attacking = true
	attack_elapsed = 0.0
	hit_emitted = false
	velocity = Vector2.ZERO
	var animation: String = weapon_definition.animation_prefix + facing_direction
	play_animation(animation if sprite.sprite_frames.has_animation(animation) else "idle_" + facing_direction)
	return true

func _physics_process(delta: float) -> void:
	concentration_remaining = maxf(0.0, concentration_remaining - delta)
	if attacking:
		attack_elapsed += delta
		if not hit_emitted and attack_elapsed >= weapon_definition.windup:
			hit_emitted = true
			attack_impact.emit(self,weapon_definition,attack_direction)
		var progress: float = clampf(attack_elapsed / (weapon_definition.windup + weapon_definition.active_time + weapon_definition.recovery),0,1)
		weapon_socket.position = attack_direction * 9.0 + Vector2(0,-8)
		weapon_socket.rotation = attack_direction.angle() + PI / 2.0 + lerpf(-1.5,1.3,sin(progress * PI / 2.0))
		# Stand-in anticipation/recovery, replaceable by attack_<direction> SpriteFrames.
		sprite.rotation = sin(progress * PI) * 0.12 * signf(attack_direction.x + 0.001)
		if progress >= 1.0:
			attacking = false
			sprite.rotation = 0
			weapon_socket.rotation = 0
			refresh_weapon()
			play_animation("idle_" + facing_direction)
	else:
		var before: Vector2 = global_position
		var was_jumping: bool = is_jumping
		super._physics_process(delta)
		if world != null and not is_jumping and not was_jumping and absf(world.terrain_height_at(global_position)-ground_height)>0.01:
			# No accidental walk-off or automatic climbing at ledge edges.
			global_position = before
			velocity = Vector2.ZERO
	queue_redraw()

func sustain_demo() -> void:
	concentration_remaining = concentration_limit

func _draw() -> void:
	draw_circle(Vector2(0,-ground_height), 7.0, Color(0.12, 0.3, 0.4, 0.18))
	if attacking:
		draw_arc(Vector2.ZERO,weapon_definition.reach,attack_direction.angle()-0.7,attack_direction.angle()+0.7,12,Color(1,0.83,0.35,0.65),2.0)
	if concentration_remaining > 0.0 and bending == null:
		# Separate effect presentation survives walking, jumping and leader rotation.
		draw_circle(Vector2(16, -20), 4.0, Color(0.2, 0.75, 1.0, 0.9))
		draw_arc(Vector2(16, -20), 6.0, -PI / 2.0,
			-PI / 2.0 + TAU * concentration_remaining / concentration_limit, 24, Color.WHITE)

func set_ground_height(value: float) -> void:
	ground_height = value
	world_height = value
	if world != null:
		collision_mask = world.terrain_collision_mask(value)
	if visuals != null:
		visuals.position.y = -value

func visible_frame_bounds(texture: Texture2D) -> Rect2i:
	var id: int = texture.get_instance_id()
	if not frame_bounds.has(id):
		frame_bounds[id] = texture.get_image().get_used_rect()
	return frame_bounds[id]

func align_sprite_feet() -> void:
	if sprite.sprite_frames == null or not sprite.sprite_frames.has_animation(sprite.animation):
		return
	var texture: Texture2D = sprite.sprite_frames.get_frame_texture(sprite.animation,sprite.frame)
	if texture == null:
		return
	var bounds: Rect2i = visible_frame_bounds(texture)
	var center: Vector2 = texture.get_size()*0.5
	var foot := Vector2(bounds.position.x+bounds.size.x*0.5,bounds.end.y)
	sprite.position = (center-foot)*sprite.scale
	sprite_ground_position = sprite.position

func start_hop(direction: Vector2) -> void:
	start_jump(Vector2.ZERO)

func start_jump(input_direction: Vector2, _allow_hop: bool = true) -> void:
	if is_jumping or attacking:
		return
	jump_from = global_position
	jump_to = global_position
	jump_from_height = ground_height
	jump_to_height = ground_height
	last_safe_jump_position = global_position
	last_safe_jump_height = ground_height
	jump_direction = input_direction.normalized()
	if jump_direction.length_squared()>0.01:
		facing_direction = get_direction_name(jump_direction)
	stationary_jump = true
	is_jumping = true
	last_jump_succeeded = false
	jump_elapsed = 0.0
	replay_trace = []
	jump_trace = [{"time":0.0,"position":global_position,"height":ground_height,"distance":0.0}]
	play_animation("jump_"+facing_direction)
	jump_started.emit(jump_direction)

func record_jump_sample() -> void:
	var distance: float = 0.0
	if not jump_trace.is_empty():
		distance = jump_trace[-1].distance+jump_trace[-1].position.distance_to(global_position)
	jump_trace.append({"time":jump_elapsed,"position":global_position,"height":world_height,"distance":distance})
	stationary_jump = distance<0.5

func start_jump_replay(trace: Array, stationary: bool = false) -> bool:
	if is_jumping or attacking or trace.size()<2:
		return false
	if not stationary and (global_position.distance_to(trace[0].position)>1.0 or absf(ground_height-trace[0].height)>0.01):
		return false
	jump_from = global_position
	jump_from_height = ground_height
	replay_offset = global_position-trace[0].position if stationary else Vector2.ZERO
	replay_height_offset = ground_height-trace[0].height if stationary else 0.0
	replay_trace = trace
	replay_index = 0
	replay_distance = 0.0
	jump_to = trace[-1].position+replay_offset
	jump_to_height = trace[-1].height+replay_height_offset
	jump_elapsed = 0.0
	stationary_jump = stationary
	is_jumping = true
	last_jump_succeeded = false
	return true

func update_jump_pose(progress: float) -> void:
	visuals.position.y = -world_height
	var animation_name: String = "jump_"+facing_direction
	if not sprite.sprite_frames.has_animation(animation_name):
		animation_name = "jump_"+get_direction_name(cardinal_from_facing(facing_direction))
	if sprite.sprite_frames.has_animation(animation_name):
		sprite.animation = animation_name
		sprite.pause()
		var count: int = sprite.sprite_frames.get_frame_count(animation_name)
		sprite.frame = mini(int(clampf(progress,0,1)*count),count-1) if count>0 else 0

func land_jump(position: Vector2, height: float, succeeded: bool) -> void:
	global_position = position
	ground_height = height
	world_height = height
	jump_to = position
	jump_to_height = height
	last_jump_succeeded = succeeded
	var was_replay: bool = not replay_trace.is_empty()
	if not was_replay:
		record_jump_sample()
	var completed: Array = jump_trace.duplicate(true) if not was_replay else []
	is_jumping = false
	replay_trace = []
	super.finish_jump()
	set_ground_height(height)
	align_sprite_feet()
	jump_finished.emit(completed)

func update_jump_replay(delta: float) -> void:
	jump_elapsed = minf(jump_elapsed+delta,float(replay_trace[-1].time))
	while replay_index+1<replay_trace.size()-1 and float(replay_trace[replay_index+1].time)<jump_elapsed:
		replay_index+=1
	var a: Dictionary = replay_trace[replay_index]
	var b: Dictionary = replay_trace[replay_index+1]
	var fraction: float = clampf((jump_elapsed-float(a.time))/maxf(0.0001,float(b.time)-float(a.time)),0,1)
	var desired: Vector2 = a.position.lerp(b.position,fraction)+replay_offset
	world_height = lerpf(a.height,b.height,fraction)+replay_height_offset
	replay_distance = lerpf(a.distance,b.distance,fraction)
	collision_mask = world.terrain_collision_mask(world_height)
	var motion: Vector2 = desired-global_position
	if move_and_collide(motion) != null:
		land_jump(jump_from,jump_from_height,false)
		return
	if motion.length_squared()>0.01:
		facing_direction = get_direction_name(motion)
	update_jump_pose(jump_elapsed/maxf(0.001,float(replay_trace[-1].time)))
	if jump_elapsed>=float(replay_trace[-1].time):
		var valid: bool = absf(world.terrain_height_at(global_position)-jump_to_height)<0.01 and world.jump_landing_allowed(global_position)
		land_jump(global_position if valid else jump_from,jump_to_height if valid else jump_from_height,valid)

func update_jump(delta: float, _move_body: bool = true) -> void:
	if not is_jumping:
		return
	if not replay_trace.is_empty():
		update_jump_replay(delta)
		return
	jump_elapsed+=delta
	var launch_speed: float = 4.0*jump_height/maxf(0.01,jump_duration)
	var gravity: float = 8.0*jump_height/maxf(0.0001,jump_duration*jump_duration)
	world_height = jump_from_height+launch_speed*jump_elapsed-0.5*gravity*jump_elapsed*jump_elapsed
	var descending: bool = launch_speed-gravity*jump_elapsed<=0
	var support: float = world.terrain_height_at(global_position)
	if descending and support>=0 and world_height<=support and world.jump_landing_allowed(global_position):
		land_jump(global_position,support,true)
		return
	collision_mask = world.terrain_collision_mask(world_height)
	# Horizontal input is live throughout the jump: no direction/distance is locked.
	var direction := Input.get_vector("move_left","move_right","move_up","move_down") if player_controlled else Vector2.ZERO
	velocity = direction*walk_speed
	move_and_slide()
	if direction.length_squared()>0.01:
		facing_direction = get_direction_name(direction)
	support = world.terrain_height_at(global_position)
	if support>=0 and world_height>=support and world.jump_landing_allowed(global_position):
		last_safe_jump_position = global_position
		last_safe_jump_height = support
	if descending and support>=0 and world_height<=support and world.jump_landing_allowed(global_position):
		land_jump(global_position,support,true)
		return
	if world_height<0 or jump_elapsed>2.0:
		land_jump(last_safe_jump_position,last_safe_jump_height,false)
		return
	record_jump_sample()
	update_jump_pose(jump_elapsed/maxf(0.01,jump_duration))

func finish_jump() -> void:
	if is_jumping:
		land_jump(jump_from,jump_from_height,false)
	else:
		super.finish_jump()
		set_ground_height(ground_height)
		align_sprite_feet()
