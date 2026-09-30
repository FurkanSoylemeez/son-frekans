extends Area2D

@onready var interaction_label = $"../InteractionLabel"
@onready var archive_panel = $"../ArchivePanel"
@onready var tape_description = $"../ArchivePanel/TapeDescription"

@onready var archive_audio = $"../ArchiveAudio"

var tape_1_audio = preload("res://assets/audio/archive/conversation_godot.mp3")

var player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		archive_panel.visible = !archive_panel.visible

func _on_body_entered(body):
	if body.name == "Murat":
		player_inside = true
		interaction_label.visible = true

func _on_body_exited(body):
	if body.name == "Murat":
		player_inside = false
		interaction_label.visible = false

func _on_tape_1_pressed() -> void:
	tape_description.text = "KASET 01\nGece Yayını\n\nTarih etiketi silinmiş.\nKasetin üzerinde yalnızca 'Gece' yazıyor."

	if archive_audio.playing:
		archive_audio.stop()
	else:
		archive_audio.stream = tape_1_audio
		archive_audio.play()
	
func _on_tape_2_pressed() -> void:
	tape_description.text = "KASET 02\nİsimsiz Kayıt\n\nEtiketi yok.\nKasetin kutusu çizilmiş ve eski görünüyor."

func _on_tape_3_pressed() -> void:
	tape_description.text = "KASET 03\n14 Ekim\n\nTarih elle yazılmış.\nKayıt uzun süredir açılmamış gibi görünüyor."
	
