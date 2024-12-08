extends Area3D

@onready var door = %Door
@export var is_teleporter = false
var is_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    var material = StandardMaterial3D.new()
    material.albedo_color = Color(1, 0, 0)
    door.material = material
    add_to_group("interaction")

func open_door():
    var material = StandardMaterial3D.new()
    material.albedo_color = Color(0, 1, 0)
    door.material = material
    is_open = true
 
func _on_body_entered(_body: Node3D) -> void:
    if is_open:
        get_tree().change_scene_to_file("res://scenes/levels/world1.tscn")
    if is_teleporter:
        get_tree().get_root().find_node("Teleporter")