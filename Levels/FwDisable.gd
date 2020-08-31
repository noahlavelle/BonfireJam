extends Node2D


func _ready():
	for fw in get_children():
		fw.get_node("AudioStreamPlayer")

