extends Control

@onready var leave_button = %LeaveButton
@onready var submit_button = %SubmitButton
@onready var password_container = %PasswordContainer
@onready var password_input = %PasswordInput
@onready var user = %User
@onready var error = %Error

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    leave_button.pressed.connect(self.hide_terminal)
    submit_button.pressed.connect(self._submit_password)
    add_to_group("interaction")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func show_terminal():
    Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
    visible = true
    error.visible = false
    Engine.time_scale = 0

func hide_terminal():
    visible = false
    Engine.time_scale = 1
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _submit_password():
    if user.get_text() == "PuppyLover12" and password_input.get_text() == "puppymama2024":
        password_container.visible = false
        get_tree().call_group("interaction", "remove_wall")
        hide_terminal()
    else:
        error.visible = true