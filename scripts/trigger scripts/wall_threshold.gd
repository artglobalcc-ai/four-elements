
extends Area2D

@export var party_controller: Node

@export_group("Wall References")
@export var left_lower_wall: Sprite2D
@export var right_lower_wall: Sprite2D
@export var left_upper_wall: Sprite2D
@export var right_upper_wall: Sprite2D

@export_group("Trigger Settings")
@export var is_inverse_trigger: bool = false

@export_group("Wall Layers")
@export var lower_outside_z: int = -1
@export var lower_inside_z: int = 1
@export var upper_outside_z: int = 1
@export var upper_inside_z: int = -1

# Remembers each character's previous position.
var previous_positions: Dictionary = {}


func _ready() -> void:
	if party_controller == null:
		push_warning(name + ": Assign PartyController.")

	var shape_node: CollisionShape2D = get_node_or_null(
        "CollisionShape2D"
	)

	if shape_node == null or not shape_node.shape is RectangleShape2D:
		push_warning(name + ": Requires a RectangleShape2D.")


func _physics_process(_delta: float) -> void:
	if party_controller == null:
		return

	if party_controller.party.is_empty():
		return

	var shape_node: CollisionShape2D = get_node_or_null(
        "CollisionShape2D"
	)

	if shape_node == null:
		return

	var rectangle: RectangleShape2D = (
		shape_node.shape as RectangleShape2D
	)

	if rectangle == null:
		return

	var half_width: float = rectangle.size.x * 0.5

	var leader: CharacterBody2D = party_controller.party[0]

	for character in party_controller.party:
		if character == null:
			continue

		# Local coordinates automatically account for rotation.
		var current_pos: Vector2 = shape_node.to_local(
			character.global_position
		)

		if previous_positions.has(character):
			var previous_pos: Vector2 = previous_positions[character]

			# Did the character cross the centerline?
			var crossed_north: bool = (
				previous_pos.y > 0.0 and current_pos.y <= 0.0
			)

			var crossed_south: bool = (
				previous_pos.y < 0.0 and current_pos.y >= 0.0
			)

			if crossed_north or crossed_south:
				# Find where the movement crossed the centerline.
				var crossing_fraction: float = (
					-previous_pos.y /
					(current_pos.y - previous_pos.y)
				)

				var crossing_x: float = lerpf(
					previous_pos.x,
					current_pos.x,
					crossing_fraction
				)

				# Only activate within the rectangle's width.
				if absf(crossing_x) <= half_width:
					if character == leader:
						if crossed_north:
							set_walls(not is_inverse_trigger)
						elif crossed_south:
							set_walls(is_inverse_trigger)

		# Save position for the next physics frame.
		previous_positions[character] = current_pos


func set_walls(is_inside: bool) -> void:
	var lower_z: int = (
		lower_inside_z if is_inside else lower_outside_z
	)

	var upper_z: int = (
		upper_inside_z if is_inside else upper_outside_z
	)

	if left_lower_wall != null:
		left_lower_wall.z_index = lower_z

	if right_lower_wall != null:
		right_lower_wall.z_index = lower_z

	if left_upper_wall != null:
		left_upper_wall.z_index = upper_z

	if right_upper_wall != null:
		right_upper_wall.z_index = upper_z

	print(
		name,
		" | Inside: ", is_inside,
		" | Lower Z: ", lower_z,
		" | Upper Z: ", upper_z
	)
