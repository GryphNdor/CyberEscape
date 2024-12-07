extends StaticBody3D

class_name Robot

@onready var hint = %Hint
@onready var hint_container = %HintContainer

var tutorial_hints = [
    "Only Picasso could make art like this!",
    "You seem to have the street smarts, but I am more of a book smarts guy myself",
    "Maybe the books and pictures are related to the password?",
]

var index = 0

func _ready() -> void:
    hint_container.visible = false
    add_to_group("interaction")

func show_hint(room: String):
    hint_container.visible = true
    if room == "tutorial":
        hint.text = tutorial_hints[index]
        index = (index + 1) % 3

func hide_hint():
    hint_container.visible = false