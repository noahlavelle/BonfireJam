extends Node2D

var player_in_area = false

onready var player = get_tree().get_root().get_node("World/Player")

func cutscene():
	$Animation/Soul.global_position = Vector2(player.global_position.x, player.global_position.y - 30)
	$Animation/Soul.show()
	$Animation/Anim.play("ScaleIn")
	get_tree().paused = true

func _physics_process(_delta):
	if Input.is_action_just_pressed("trade") and player_in_area:
		cutscene()

func _on_Anim_animation_finished(anim_name):
	$Animation/SoulParticles.global_position = Vector2(player.global_position.x, player.global_position.y - 30)
	$Animation/SoulParticles.restart()
	$Animation/Soul.hide()
	yield(get_tree().create_timer(2.6), "timeout")
	get_tree().paused = false


func _on_Area2D_body_entered(body):
	player_in_area = true
	$Animation/EKey.show()


func _on_Area2D_body_exited(body):
	player_in_area = false
	$Animation/EKey.hide()
