extends Control

const LEVEL_BTN = preload("res://scenes/screens/lvl_btn.tscn")
@export_dir var dir_path

@onready var grid = $MarginContainer/VBoxContainer/GridContainer

func _ready() -> void:
	get_levels(dir_path)

func get_levels(path) -> void:
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		var file_names = []
		while file_name != "":
			file_names.push_front(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()

		file_names.sort()
		
		for file in file_names:
			print(file)
			create_level_btn('%s/%s' % [dir.get_current_dir(), file], file)
	else:
		print("An error occurred when trying to access the path.")
		
		
func create_level_btn(lvl_path, lvl_name) -> void:
	var btn = LEVEL_BTN.instantiate()
	btn.text = lvl_name.trim_suffix('.tscn').replace("_", " ")
	btn.level_path = lvl_path
	grid.add_child(btn)
