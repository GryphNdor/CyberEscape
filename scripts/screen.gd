extends Control

@onready var leave_button = %LeaveButton
@onready var submit_button = %SubmitButton
@onready var password_container = %PasswordContainer
@onready var password_input = %PasswordInput
@onready var error = %Error

@export var current_world = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    leave_button.pressed.connect(self.hide_screen)
    submit_button.pressed.connect(self._submit_password)
    add_to_group("interaction")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func show_screen():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    visible = true
    error.visible = false
    Engine.time_scale = 0

func hide_screen():
    visible = false
    Engine.time_scale = 1
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _submit_password():
    match (current_world):
        "tutorial":
            if password_input.get_text() == "2532":
                password_container.visible = false
                get_tree().call_group("interaction", "open_door")
                hide_screen()
            else:
                error.visible = true