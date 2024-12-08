extends Control

@onready var info = %Info

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("interaction")

func show_info_screen(text):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	info.text = text
	visible = true
	Engine.time_scale = 0

func hide_info_screen():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	visible = false
	Engine.time_scale = 1
