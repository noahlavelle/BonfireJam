extends MarginContainer

var current_level

func _ready():
	var dir = Directory.new()
	if not dir.file_exists('res://Saves/save.tres'):
		$HBoxContainer/VBoxContainer/TextureButton3.hide()
	else:
		current_level = load('res://Saves/save.tres').Level

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Levels/L1.tscn")

func _on_TextureButton3_pressed():
	var file = "res://Levels/L" + str(current_level) + ".tscn"
	print(file)
	get_tree().change_scene(file)
