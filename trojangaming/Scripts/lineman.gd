extends CharacterBody2D

@onready var sprite = $"AnimatedSprite2D"

@export var pos: Array[Vector2]

@export var speed = 300.0

var current = 0

func _ready() -> void:
	sprite.play("default")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(pos[current])
	velocity = direction * speed
	if velocity.x > 0:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	move_and_slide()
	if (global_position - pos[current]).length() < 5.0:
		print("switch")
		if current < pos.size() - 1:
			current += 1
		else:
			current = 0


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.knockback(velocity)
