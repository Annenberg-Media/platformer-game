extends Area2D

@onready var _goal_ui = $"../../CanvasLayer/GoalMenu"

func _on_body_entered(body):
	print("on body enter")
	if body.is_in_group("Player"):
		print("player")
		_goal_ui.level_over = true;
		
		
