extends Node2D

func _on_Button_pressed():
	$WinBox.get_node("CanvasLayer/ColorRect").show()
	$WinBox.get_node("AnimationPlayer").play("TransOut")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "TransOut":
		get_tree().change_scene("res://HomeScreen.tscn")
