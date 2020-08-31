extends AudioStreamPlayer

var newVolume
var path

func _ready():
	var _connection = $Tween.connect("tween_completed", self, "changeTrack")
	OS.window_fullscreen = true

func free_body(body):
	body.queue_free()

func swapTrack(_newVolume, _path):
	if _path != stream:
		newVolume = _newVolume
		path = _path
		$Tween.interpolate_property(self, "volume_db",
			volume_db, -50, 1,
		$Tween.TRANS_LINEAR, $Tween.EASE_IN_OUT)
		$Tween.start()

func changeTrack(_object, _key):
	stream = path
	playing = true
	volume_db = newVolume
	
