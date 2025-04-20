extends AnimatedSprite2D

var speed = 50.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position.x = get_viewport().get_visible_rect().size.x + 100
	global_position.y = randf_range(0, get_viewport().get_visible_rect().size.y / 3)
	play(str(randi_range(1, 4)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta * speed
	if position.x <= -100:
		queue_free()
