extends Node

func spawnFootball(pos):
	var scene = load("res://Scenes/football.tscn")
	var fb = scene.instantiate()
	fb.global_position = pos
	get_tree().root.call_deferred("add_child", fb)
