extends Particles2D

onready var player = get_parent().get_parent().get_node("Player")

func _physics_process(delta):
	rotation += get_angle_to(player.global_position) * 0.05
