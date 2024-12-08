extends StaticBody3D
class_name Book
@onready var volume = %Volume

@export var current_world = ""
@export var book_number: int = 0

var tutorial_info = [
    "Hey you found an information book! There may be one or more of these books around each level. Some books are here to give general information like this one, or give insights to real world applications of cyber security and others may help you solve a particular puzzle. You never know so you should read them all!"
]

var world1_info = [
    "Hey you found an information book! There may be one or more of these books around each level. Some books are here to give general information like this one, or give insights to real world applications of cyber security and others may help you solve a particular puzzle. You never know so you should read them all!"
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    add_to_group("interaction")
    volume.text = "Vol " + str(book_number)

func get_book_info() -> String:
    match (current_world):
        "tutorial":
            return tutorial_info[book_number]
        "world1":
            return world1_info[book_number]
        _:
            return ""