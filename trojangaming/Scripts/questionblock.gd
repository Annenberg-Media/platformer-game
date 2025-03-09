extends Area2D

@onready var _animated_sprite_2d = $AnimatedSprite2D

enum {
	ACTIVE,
	USED
}
var state = ACTIVE

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_animated_sprite_2d.play("default")

func _on_body_entered(body):
	if body.is_in_group("Player") and state == ACTIVE:
		state = USED
		_animated_sprite_2d.play("spent")
		Global.spawnFootball(self.global_position + Vector2(0, -32))
		
