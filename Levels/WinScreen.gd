extends Node2D

func _input(event):
	if event is InputEventMouseButton:
		var dir = Directory.new()
		if dir.file_exists('user://Saves/save.tres'):
			dir.remove('user://Saves/save.tres')
		$WinBox.get_node("CanvasLayer/ColorRect").show()
		$WinBox.get_node("AnimationPlayer").play("TransOut")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "TransOut":
		get_tree().change_scene("res://HomeScreen.tscn")
