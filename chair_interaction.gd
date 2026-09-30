extends Area2D

@onready var chair_label = $"../ChairInteractionLabel"
@onready var murat = $"../Murat"
@onready var murat_sprite = $"../Murat/MuratSprite"
@onready var murat_sitting = $"../MuratSitting"
@onready var chair = $"../Chair"

var player_inside = false
var is_sitting = false

func _ready():
	murat_sitting.visible = false
	chair.visible = true
	chair_label.visible = false

	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

	if not body_exited.is_connected(_on_body_exited):
		body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		if is_sitting:
			stand_up()
		else:
			sit_down()

func _on_body_entered(body):
	if body.name == "Murat":
		player_inside = true
		chair_label.text = "E - Otur"
		chair_label.visible = true

func _on_body_exited(body):
	if body.name == "Murat" and not is_sitting:
		player_inside = false
		chair_label.visible = false

func sit_down():
	is_sitting = true

	murat_sprite.visible = false
	murat_sitting.visible = true
	chair.visible = false

	murat.velocity.x = 0
	murat.can_move = false
	murat.set_physics_process(false)

	chair_label.text = "E - Kalk"

func stand_up():
	is_sitting = false

	murat_sprite.visible = true
	murat_sitting.visible = false
	chair.visible = true

	murat.can_move = true
	murat.set_physics_process(true)

	chair_label.text = "E - Otur"
	
