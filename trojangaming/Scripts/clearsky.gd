extends CanvasLayer

var interval = 8.0
var timer = 0.0

var cloudSC = preload("res://Scenes/cloud.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layer = -128


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if timer <= 0.0 && randf_range(0.0, 1.0) < 0.5:
		var cloud = cloudSC.instantiate()
		add_child(cloud)
		timer = interval
	if timer > 0.0:
		timer -= delta
