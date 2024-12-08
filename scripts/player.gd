extends CharacterBody3D

class_name Player

var speed
const WALK_SPEED = 3.0
const JUMP_VELOCITY = 4.8
const SENSITIVITY = 0.004

#bob variables
const BOB_FREQ = 1.4
const BOB_AMP = 0.01
var t_bob = 0.0

#fov variables
const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8

@onready var head = %Pivot
@onready var camera = %Pivot/Camera3D
@onready var ray = %Pivot/Camera3D/RayCast3D

@export var current_world = ""

var can_interact = ""
var text = ""
var teleport_position

func _ready():
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func _unhandled_input(event):
    if event is InputEventMouseMotion:
        head.rotate_y(-event.relative.x * SENSITIVITY)
        camera.rotate_x(-event.relative.y * SENSITIVITY)
        camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))

func in_range(collision_body) -> void:
    # print(collision_body)
    if (collision_body is Computer):
        get_tree().call_group("interaction", "player_in_range")
        can_interact = "computer"
    elif (collision_body is Robot):
        get_tree().call_group("interaction", "player_in_range")
        can_interact = "robot"
    elif (collision_body is Book):
        get_tree().call_group("interaction", "player_in_range")
        can_interact = "book"
        var book = collision_body as Book
        text = book.get_book_info()
    elif (collision_body is Teleporter):
        get_tree().call_group("interaction", "player_in_range")
        can_interact = "teleporter"
        var tele = collision_body as Teleporter
        teleport_position = tele.get_linked()
    else:
        can_interact = ""
        text = ""

func _physics_process(delta):
    # Add the gravity.
    if not is_on_floor():
        velocity.y -= gravity * delta
    
    if (ray.is_colliding()):
        var c = ray.get_collider()
        in_range(c)
    else:
        can_interact = ""
        get_tree().call_group("interaction", "player_out_range")

    
    speed = WALK_SPEED

    # Disabled but handles jump
    # if Input.is_action_just_pressed("jump") and is_on_floor():
    #     velocity.y = JUMP_VELOCITY

    if Input.is_action_just_pressed("interact") and can_interact == "computer":
        get_tree().call_group("interaction", "show_screen")

    if Input.is_action_just_pressed("interact") and can_interact == "robot":
        get_tree().call_group("interaction", "get_hint", current_world)

    if Input.is_action_just_pressed("interact") and can_interact == "book":
        get_tree().call_group("interaction", "show_info_screen", text)

    if Input.is_action_just_pressed("interact") and can_interact == "teleporter":
        position = teleport_position

    if Input.is_action_pressed("ui_cancel"):
        get_tree().call_group("interaction", "hide_screen")
        get_tree().call_group("interaction", "hide_info_screen")
        get_tree().call_group("interaction", "hide_hint")
        # get_tree().quit()

    # Get the input direction and handle the movement/deceleration.
    var input_dir = Input.get_vector("left", "right", "up", "down")
    var direction = (head.transform.basis * transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
    if is_on_floor():
        if direction:
            velocity.x = direction.x * speed
            velocity.z = direction.z * speed
        else:
            velocity.x = lerp(velocity.x, direction.x * speed, delta * 7.0)
            velocity.z = lerp(velocity.z, direction.z * speed, delta * 7.0)
    else:
        velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
        velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)

    # FOV
    var velocity_clamped = clamp(velocity.length(), 0.5, speed * 2)
    var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
    camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

    move_and_slide()

    for i in get_slide_collision_count():
        var c = get_slide_collision(i)
        # check for collidable objects and give them a push in the opposite direction
        if c.get_collider() is RigidBody3D:
            c.get_collider().apply_central_impulse(-c.get_normal())
