extends Node2D

func _physics_process(delta):
	position.x += 1

var current_level
var save_profile = false

func _ready():
	$Camera2D/CanvasLayer/Transition/CanvasLayer/ColorRect.show()
	var dir = Directory.new()
	if not dir.file_exists('res://Saves/save.tres'):
		$Camera2D/CanvasLayer/TitleScreen/Continue/Label.add_color_override("font_color", '646464')
	else:
		current_level = load('res://Saves/save.tres').Level
		$Camera2D/CanvasLayer/TitleScreen/Continue/Label.text += '(' + str(current_level) + ')'
		save_profile = true

func _on_NewGame_pressed():
	$Camera2D/CanvasLayer/Transition.get_node("AnimationPlayer").play("TransOut")
	yield(get_tree().create_timer(0.4), "timeout")
	get_tree().change_scene("res://Levels/L1.tscn")

func _on_Continue_pressed():
	if save_profile == true:
		var file = "res://Levels/L" + str(current_level) + ".tscn"
		$Camera2D/CanvasLayer/Transition.get_node("AnimationPlayer").play("TransOut")
		yield(get_tree().create_timer(0.4), "timeout")
		get_tree().change_scene(file)
