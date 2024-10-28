extends Node3D
class_name StaticHitbox

@export var item: Node3D

func _ready():
    for child in item.get_children():
        if child is MeshInstance3D:
            # create hitbox
            child.create_trimesh_collision()
