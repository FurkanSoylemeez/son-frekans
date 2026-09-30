extends Panel

@onready var song_1_button = $Song1Button
@onready var song_2_button = $Song2Button
@onready var close_button = $CloseButton
@onready var music_player = $"../MusicPlayer"

var song_1 = preload("res://assets/audio/music/gece_yolu.mp3")
var song_2 = preload("res://assets/audio/music/uzaklarda.mp3")

func _ready():
	visible = false

	song_1_button.pressed.connect(_on_song_1_pressed)
	song_2_button.pressed.connect(_on_song_2_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

func _on_song_1_pressed():
	music_player.stream = song_1
	music_player.play()

func _on_song_2_pressed():
	music_player.stream = song_2
	music_player.play()

func _on_close_button_pressed():
	visible = false
	
