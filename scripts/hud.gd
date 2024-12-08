extends Control
class_name HUD

@onready var hint = %Hint
@onready var hint_container = %HintContainer
@onready var interaction_label = %InteractionLabel

func _ready() -> void:
    add_to_group("interaction")

func player_in_range():
    interaction_label.visible = true

func player_out_range():
    interaction_label.visible = false

func show_hint(text):
    hint_container.visible = true
    hint.text = text

func hide_hint():
    hint_container.visible = false
