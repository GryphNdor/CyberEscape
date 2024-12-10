extends Control

const TUTORIAL = "res://scenes/levels/tutorial.tscn"
const WORLD_1 = "res://scenes/levels/world1.tscn"
const WORLD_2 = "res://scenes/levels/world2.tscn"
const WORLD_3 = "res://scenes/levels/world3.tscn"

@onready var button1 = %Button
@onready var button2 = %Button2
@onready var button3 = %Button3
@onready var button4 = %Button4

func _ready() -> void:
  button1.pressed.connect(self._goto_tutorial)
  button2.pressed.connect(self._goto_world_one)
  button3.pressed.connect(self._goto_world_two)
  button4.pressed.connect(self._goto_world_three)

func _goto_tutorial():
  get_tree().change_scene_to_file(TUTORIAL)

func _goto_world_one():
  get_tree().change_scene_to_file(WORLD_1)

func _goto_world_two():
  get_tree().change_scene_to_file(WORLD_2)

func _goto_world_three():
  get_tree().change_scene_to_file(WORLD_3)