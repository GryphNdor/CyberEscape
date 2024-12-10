extends CSGBox3D
class_name Teleporter

@export var linked_teleporter: Teleporter
@onready var teleport_spot = %TeleportSpot

func get_linked():
    return linked_teleporter.teleport_spot.global_position
