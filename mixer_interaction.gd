extends Area2D

@onready var collision = $CollisionShape2D
@onready var chair_interaction = $"../ChairInteraction"
@onready var mouse_label = $"../MouseInteractionLabel"
@onready var dialogue_panel = $"../PhoneDialoguePanel"
@onready var mixer_panel = $"../MixerPanel"

func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	var shape = collision.shape

	if shape is RectangleShape2D:
		var half_size = shape.size / 2.0
		var center = collision.global_position

		var mouse_inside = (
			mouse_pos.x >= center.x - half_size.x
			and mouse_pos.x <= center.x + half_size.x
			and mouse_pos.y >= center.y - half_size.y
			and mouse_pos.y <= center.y + half_size.y
		)

		if mouse_inside \
		and chair_interaction.is_sitting \
		and not dialogue_panel.visible \
		and not mixer_panel.visible:
			mouse_label.visible = true
			mouse_label.text = "Aç"
			mouse_label.global_position = mouse_pos + Vector2(15, 15)

func _input(event):
	if dialogue_panel.visible or mixer_panel.visible:
		return

	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var mouse_pos = get_global_mouse_position()
			var shape = collision.shape

			if shape is RectangleShape2D:
				var half_size = shape.size / 2.0
				var center = collision.global_position

				var mouse_inside = (
					mouse_pos.x >= center.x - half_size.x
					and mouse_pos.x <= center.x + half_size.x
					and mouse_pos.y >= center.y - half_size.y
					and mouse_pos.y <= center.y + half_size.y
				)

				if mouse_inside and chair_interaction.is_sitting:
					mouse_label.visible = false
					mixer_panel.visible = true
					
