extends Node2D

export(int) var Level
export(Script) var game_save_class

export var soulCount = 2

func verify_Save():
	pass

func save_world():
	var dir_to_save = 'res://Saves/'
	var new_save = game_save_class.new()
	new_save.Level = Level
	var dir = Directory.new()
	if not dir.dir_exists(dir_to_save):
		dir.make_dir_recursive(dir_to_save)
	ResourceSaver.save(dir_to_save + 'save.tres', new_save)

func load_save():
	pass

func _ready():
	save_world()
