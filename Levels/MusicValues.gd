extends Node

export var volume = -15
export (Resource) var path = load("res://Assets/Music/Overworld.wav")

func _ready():
	Music.swapTrack(volume, path)
