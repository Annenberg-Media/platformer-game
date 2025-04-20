extends CanvasLayer

@onready var rain = $"Rain"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	layer = -128
	rain.position.y = -200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rain.position.x = randf_range(0, get_viewport().get_visible_rect().size.x)
