extends StaticBody3D

class_name Robot

var tutorial_hints = [
    "Only Picasso could make art like this!",
    "You seem to have the street smarts, but I am more of a book smarts guy myself",
    "Maybe the books and pictures are related to the password?",
]

var world1_hints = [
    "Believe in Purself... hm that seems suspect",
    "You seem to have the street smarts, but I am more of a book smarts guy myself",
    "Maybe the books and pictures are related to the password?",
]

var index = 0

func _ready() -> void:
    add_to_group("interaction")

func get_hint(room: String):
    var text = ""
    match (room):
        "tutorial":
            text = tutorial_hints[index]
        "world1":
            text = world1_hints[index]
    index = (index + 1) % 3
    get_tree().call_group("interaction", "show_hint", text)
    print(room)
