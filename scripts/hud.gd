extends Control
class_name HUD

@onready var hint = %Hint
@onready var hint_container = %HintContainer
@onready var interaction_label = %InteractionLabel
@onready var pause_container = %PauseContainer
@onready var pause_button = %PauseButton

const MAIN = preload("res://scenes/screens/main_menu.tscn")

var is_paused = false
func _ready() -> void:
    pause_button.pressed.connect(self._goto_main)
    add_to_group("interaction")

func player_in_range():
    interaction_label.visible = true

func _goto_main():
    Engine.time_scale = 1
    get_tree().change_scene_to_packed.call_deferred(MAIN)
    is_paused = false

func pause():
    is_paused = !is_paused
    pause_container.visible = is_paused
    if (is_paused):
        Engine.time_scale = 0
        Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    else:
        Engine.time_scale = 1
        Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func player_out_range():
    interaction_label.visible = false

func show_hint(text):
    hint_container.visible = true
    hint.text = text

func hide_hint():
    hint_container.visible = false
