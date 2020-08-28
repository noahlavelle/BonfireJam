extends StaticBody2D

func _ready():
	yield(get_tree().create_timer(3), "timeout")
	cutscene()

func cutscene():
	$SoulAnimate.play("ScaleIn")
