extends StaticBody2D

var player_in_area = false

func _ready():
	$"e key".hide()
	yield(get_tree().create_timer(3), "timeout")
	cutscene()

func cutscene():
	$SoulAnimate.play("ScaleIn")

func _physics_process(delta):
	if Input.is_action_just_pressed("trade") and player_in_area:
		print('E pressed')

func _on_Area2D_area_entered(area):
	player_in_area = true
	$"e key".show()
	


func _on_Area2D_area_exited(area):
	player_in_area = false
	$"e key".hide()
