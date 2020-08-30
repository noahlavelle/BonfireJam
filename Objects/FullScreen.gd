extends AudioStreamPlayer

func _ready():
	OS.window_fullscreen = true

func free_body(body):
	body.queue_free()
