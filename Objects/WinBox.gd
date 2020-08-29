extends Area2D

export var pathToScene = "res://Levels/L1.tscn"

onready var player = get_tree().get_root().get_node("World/Player")

func _on_WinBox_body_entered(body):
	if body == player:
		$AnimationPlayer.play("TransOut")
		yield(get_tree().create_timer(0.4), "timeout")
		get_tree().change_scene(pathToScene)
