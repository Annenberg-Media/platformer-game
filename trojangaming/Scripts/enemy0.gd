extends CharacterBody2D


func _physics_process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.lives -= 1
		if body.lives <= 0:
			get_tree().reload_current_scene();
