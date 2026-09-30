
extends CharacterBody2D

@export var speed: float = 350.0
@export var gravity: float = 1800.0
var can_move = true
@onready var sprite = $MuratSprite

func _ready():
	sprite.play("idle")

func _physics_process(delta):
	var direction = 0.0

	if can_move:
		direction = Input.get_axis("move_left", "move_right")
		velocity.x = direction * speed
	else:
		velocity.x = 0

	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0

	if direction == 0:
		sprite.play("idle")
	else:
		sprite.play("walk")
		sprite.flip_h = direction > 0

	move_and_slide()
	
