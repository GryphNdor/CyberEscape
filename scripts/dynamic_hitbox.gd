extends Node3D
class_name DynamicHitbox

@onready var body = $Body
# packedscene to instantiate on fly (using node3d has parenting issues)
@export var item: PackedScene
@export var weight: int = 1 # kg

func _ready():
    var item_node = item.instantiate()
    body.add_child(item_node)
    body.mass = weight
    # if a better resource like static generation is found please replace
    for child in item_node.get_children():
        if child is MeshInstance3D:
            var collision_shape = CollisionShape3D.new()
            collision_shape.set_shape(child.mesh.create_convex_shape(true, true))
            body.add_child(collision_shape)
