extends Panel

@onready var speaker_name = $SpeakerName
@onready var dialogue_text = $DialogueText

var dialogue_index = 0

var dialogue = [
	{
		"speaker": "ARAYAN",
		"text": "İyi geceler."
	},
	{
		"speaker": "MURAT",
		"text": "97.3, Son Gece. Kiminle konuşuyorum?"
	},
	{
		"speaker": "ARAYAN",
		"text": "Valla isim vermesek?"
	},
	{
		"speaker": "MURAT",
		"text": "Borcunuz mu var?"
	}
]

func _ready():
	visible = false

func start_dialogue():
	dialogue_index = 0
	show_current_line()

func show_current_line():
	speaker_name.text = dialogue[dialogue_index]["speaker"]
	dialogue_text.text = dialogue[dialogue_index]["text"]

func next_line():
	dialogue_index += 1

	if dialogue_index < dialogue.size():
		show_current_line()
	else:
		visible = false

func _input(event):
	if visible and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			next_line()
			
