extends Node
class_name RemovableWall

func _ready() -> void:
    add_to_group("interaction")

func remove_wall():
    queue_free()