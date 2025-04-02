extends Node

# var wallJump = false

func spawnFootball(pos):
	var scene = load("res://Scenes/football.tscn")
	var fb = scene.instantiate()
	fb.global_position = pos
	get_tree().root.call_deferred("add_child", fb)

func player_damage(body) -> void:
	body.hurt()
	for n in randi_range(10, 15):
		var scene = load("res://Scenes/particle.tscn")
		var px = scene.instantiate()
		px.anim = "red"
		px.offset = Vector2(randf_range(-5.0, 5.0), randf_range(-5.0, 5.0))
		# px.global_position = self.global_position + Vector2(randi_range(-15, 15), 15)
		if is_instance_valid(body):
			body.call_deferred("add_child", px)
		await get_tree().create_timer(randf_range(0.0, 0.02)).timeout
