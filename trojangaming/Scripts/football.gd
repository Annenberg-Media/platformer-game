extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	linear_velocity += Vector2(100, -50)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.wallJump = true
		queue_free()
