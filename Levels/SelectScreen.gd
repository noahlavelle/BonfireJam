extends Node2D

func _ready():
	$Camera2D/CanvasLayer/Transition/CanvasLayer/ColorRect.show()
	for button in $Camera2D/CanvasLayer/Buttons.get_children():
		button.get_node("Button").connect("pressed", self, "buttonPressed", [button])

func buttonPressed(button):
	get_tree().paused = true
	$Camera2D/CanvasLayer/Transition/AnimationPlayer.play("TransOut")
	yield(get_tree().create_timer(0.4), "timeout")
	get_tree().change_scene("res://Levels/L" + button.name + ".tscn")

