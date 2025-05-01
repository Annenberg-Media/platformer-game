extends Area2D

@onready var _goal_ui = $"../../CanvasLayer/GoalMenu"

func _on_body_entered(body):
	print("body entered")
	if body.is_in_group("Player"):
		_goal_ui.show();
		
