extends Label

func _ready() -> void:
    add_to_group("interaction")

func player_in_range():
    visible = true

func player_out_range():
    visible = false