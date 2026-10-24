extends CharacterBody2D

signal jump_started(direction: Vector2)

@export var walk_speed: float = 65.0
@export var jump_duration: float = 0.50
@export var jump_height: float = 18.0
@export var jump_travel_speed: float = 65.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var player_controlled: bool = false
var facing_direction: String = "down"

var is_jumping: bool = false
var jump_elapsed: float = 0.0
var jump_direction: Vector2 = Vector2.ZERO
var sprite_ground_position: Vector2 = Vector2.ZERO


func _ready() -> void:
	sprite_ground_position = sprite.position
	play_animation("idle_" + facing_direction)


func _physics_process(delta: float) -> void:
	if not player_controlled:
		return

	if is_jumping:
		update_jump(delta)
		return

	var direction: Vector2 = Input.get_vector(
		"move_left", "move_right", "move_up", "move_down"
	)

	if Input.is_action_just_pressed("jump"):
		start_jump(direction)
		update_jump(delta)
		return

	velocity = direction * walk_speed
	move_and_slide()

	if direction.length_squared() > 0.001:
		facing_direction = get_direction_name(direction)
		play_animation("walk_" + facing_direction)
	else:
		play_animation("idle_" + facing_direction)


func start_jump(input_direction: Vector2) -> void:
	if is_jumping:
		return

	jump_direction = cardinal_direction(input_direction)
	if jump_direction == Vector2.ZERO:
		jump_direction = cardinal_from_facing(facing_direction)

	facing_direction = get_direction_name(jump_direction)
	is_jumping = true
	jump_elapsed = 0.0
	play_animation("jump_" + facing_direction)
	jump_started.emit(jump_direction)


func update_jump(delta: float, move_body: bool = true) -> void:
	jump_elapsed += delta
	var progress: float = clampf(jump_elapsed / maxf(jump_duration, 0.01), 0.0, 1.0)

	# The leader uses physics. Followers are positioned by PartyController.
	if move_body:
		velocity = jump_direction * jump_travel_speed
		move_and_slide()

	# Only the visual sprite rises; the collision shape stays grounded.
	var height: float = sin(progress * PI) * jump_height
	sprite.position = sprite_ground_position + Vector2(0.0, -height)

	# Drive three poses by jump progress, independently of animation FPS.
	var animation_name: String = "jump_" + facing_direction
	if sprite.sprite_frames != null and sprite.sprite_frames.has_animation(animation_name):
		if sprite.animation != animation_name:
			sprite.play(animation_name)
		sprite.pause()
		var count: int = sprite.sprite_frames.get_frame_count(animation_name)
		if count > 0:
			var frame_index: int = mini(int(progress * count), count - 1)
			sprite.frame = frame_index

	if progress >= 1.0:
		finish_jump()


func finish_jump() -> void:
	is_jumping = false
	jump_elapsed = 0.0
	velocity = Vector2.ZERO
	sprite.position = sprite_ground_position
	play_animation("idle_" + facing_direction)


func cardinal_direction(direction: Vector2) -> Vector2:
	if direction.length_squared() < 0.001:
		return Vector2.ZERO
	if absf(direction.x) >= absf(direction.y):
		return Vector2(signf(direction.x), 0.0)
	return Vector2(0.0, signf(direction.y))


func cardinal_from_facing(direction_name: String) -> Vector2:
	match direction_name:
		"up", "up_left", "up_right":
			return Vector2.UP
		"down", "down_left", "down_right":
			return Vector2.DOWN
		"left":
			return Vector2.LEFT
		"right":
			return Vector2.RIGHT
	return Vector2.DOWN


func set_player_controlled(value: bool) -> void:
	player_controlled = value
	if not value:
		if is_jumping:
			finish_jump()
		velocity = Vector2.ZERO


func set_facing(direction_name: String, moving: bool) -> void:
	if is_jumping:
		return
	facing_direction = direction_name
	if moving:
		play_animation("walk_" + facing_direction)
	else:
		play_animation("idle_" + facing_direction)


func get_direction_name(direction: Vector2) -> String:
	var angle: float = rad_to_deg(direction.angle())
	if angle >= -22.5 and angle < 22.5:
		return "right"
	elif angle >= 22.5 and angle < 67.5:
		return "down_right"
	elif angle >= 67.5 and angle < 112.5:
		return "down"
	elif angle >= 112.5 and angle < 157.5:
		return "down_left"
	elif angle >= 157.5 or angle < -157.5:
		return "left"
	elif angle >= -157.5 and angle < -112.5:
		return "up_left"
	elif angle >= -112.5 and angle < -67.5:
		return "up"
	else:
		return "up_right"


func play_animation(animation_name: String) -> void:
	if sprite.sprite_frames == null:
		return
	if not sprite.sprite_frames.has_animation(animation_name):
		return
	if sprite.animation != animation_name or not sprite.is_playing():
		sprite.play(animation_name)
