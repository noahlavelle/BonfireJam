extends Label

var hovered = false

func _ready():
	$Sprite.set_texture(load("res://LevelImages/" + name + ".png"))

func _process(delta):
	if (get_global_mouse_position().x > rect_position.x and get_global_mouse_position().x < rect_position.x + 28) and (get_global_mouse_position().y > rect_position.y and get_global_mouse_position().y < rect_position.y + 16):
		if hovered == false:
			var streamPlayer = AudioStreamPlayer.new()
			add_child(streamPlayer)
			streamPlayer.stream = load("res://Assets/Sounds/hover.wav")
			streamPlayer.play()
			$AnimationPlayer.play("HoverIn")
		hovered = true
	elif hovered == true:
		hovered = false
		$AnimationPlayer.play("HoverOut")
