extends Control

func _on_level_1_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level1.tscn");

func _on_level_2_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level2.tscn");
	
func _on_level_3_button_up() -> void:
	get_tree().change_scene_to_file("res://Scenes/levels/level3.tscn");

func _on_quit_button_up() -> void:
	get_tree().quit();
