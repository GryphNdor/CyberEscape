extends CSGBox3D
class_name Teleporter

@export var linked_teleporter: Node

func get_linked():
    return linked_teleporter.global_position
