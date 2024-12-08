extends Control
class_name HUD

@onready var hint = %Hint
@onready var hint_container = %HintContainer
@onready var basics = %Basics

func _ready() -> void:
    add_to_group("interaction")

func enable_basics():
    basics.visible = true

func disable_basics():
    basics.visible = false

func show_hint(text):
    hint_container.visible = true
    hint.text = text

func hide_hint():
    hint_container.visible = false