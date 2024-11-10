class_name MainMenu
extends Control

@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Start_Button as Button
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/Exit_Button as Button
@onready var level_select_screen = preload("res://scenes/screens/level_select_screen.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)


func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(level_select_screen)
	

func on_exit_pressed() -> void:
	get_tree().quit()
