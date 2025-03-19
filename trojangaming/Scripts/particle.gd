extends RigidBody2D

var expire = 4.0
var anim = "big"
var offset = Vector2(randi_range(-16, 16), 28)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = get_parent().global_position + offset
	linear_velocity += Vector2(randi_range(-25, 25), -100)
	$AnimatedSprite2D.play(anim)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	expire = expire - 0.1
	if expire <= 0:
		queue_free()
