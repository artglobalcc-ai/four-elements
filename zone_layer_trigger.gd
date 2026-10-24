extends Area2D

@export var party_controller: Node

@export_group("Layer Settings")
@export var target_sprites: Array[CanvasItem] = []
@export var inside_z: int = 1
@export var outside_z: int = -1

var last_inside: bool = false


func _ready() -> void:
	if party_controller == null:
		push_warning(name + ": Assign PartyController.")
		return

	# Check the party's starting position.
	update_zone()


func _physics_process(_delta: float) -> void:
	update_zone()


func update_zone() -> void:
	if party_controller == null:
		return

	if party_controller.party.is_empty():
		return

	var inside: bool = false

	# Check EVERY character in the party,
	# not just the current leader.
	for character in party_controller.party:
		if character == null:
			continue

		for body in get_overlapping_bodies():
			if body == character:
				inside = true
				break

		# As soon as one party member is detected,
		# the zone must remain active.
		if inside:
			break

	# Only update the visual layers when
	# the zone's state actually changes.
	if inside != last_inside:
		last_inside = inside
		set_layers(inside)


func set_layers(is_inside: bool) -> void:
	var new_z: int = inside_z if is_inside else outside_z

	for sprite in target_sprites:
		if sprite != null:
			sprite.z_index = new_z

	print(name, " | Inside: ", is_inside, " | Z: ", new_z)
