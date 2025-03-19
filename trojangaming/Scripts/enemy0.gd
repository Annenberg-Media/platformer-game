extends CharacterBody2D


func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_damage(body)
		body.lives -= 1
		if body.lives <= 0:
			get_tree().call_deferred("reload_current_scene")

func player_damage(body) -> void:
	for n in randi_range(10, 15):
		var scene = load("res://Scenes/particle.tscn")
		var px = scene.instantiate()
		px.anim = "red"
		px.offset = Vector2(randf_range(-5.0, 5.0), randf_range(-5.0, 5.0))
		# px.global_position = self.global_position + Vector2(randi_range(-15, 15), 15)
		body.call_deferred("add_child", px)
		await get_tree().create_timer(randf_range(0.0, 0.02)).timeout
