extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const WALL_JUMP_PUSHBACK = 2000.0
const GRAVITY = 15
const GRAVITY_WALL_SLIDE = 40

@onready var scooterSprite = $"Scooter"

var speedMult = 1.0

var wallJump = false
var scooter = false # TODO

var lives = 3

func _ready() -> void:
	scooterSprite.visible = false

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED * speedMult
		if scooter:
			if direction > 0:
				scooterSprite.flip_h = false
				scooterSprite.offset.x = 10
			else:
				scooterSprite.flip_h = true
				scooterSprite.offset.x = -10
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * speedMult)
	
	if wallJump:
		if randi_range(1, 2) == 1:
			var scene = load("res://Scenes/particle.tscn")
			var px = scene.instantiate()
			# px.global_position = self.global_position + Vector2(randi_range(-15, 15), 15)
			add_child(px)
	
	jump()
	wall_slide(delta, direction)
	move_and_slide()
	if(position.y > 400): 
		get_tree().call_deferred("reload_current_scene");

func jump():
	velocity.y += GRAVITY
	if Input.is_action_just_pressed("ui_accept"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		if is_on_wall() && wallJump:
			velocity.y = JUMP_VELOCITY
			# TODO fix this, resets the x vel on next frame so glitches weirdly
			velocity.x = WALL_JUMP_PUSHBACK * get_wall_normal().x

func wall_slide(delta, dir):
	if is_on_wall() and !is_on_floor() and dir:
		velocity.y += (GRAVITY_WALL_SLIDE * delta)
		velocity.y = min(velocity.y, GRAVITY_WALL_SLIDE)

func getScooter():
	if !scooter:
		scooterSprite.visible = true
		scooter = true
		speedMult += 0.75

func hurt() -> void:
	$screenflash.play("hurt")
