extends Control

@onready var _player = $"../../Player";
var level_over = false;
var showing_ui = false;
func resume():
	hide();
	get_tree().paused = false;

func pause():
	show();
	get_tree().paused = true;

func checkPlayer():
	if(level_over && !showing_ui):
		showing_ui = true;
		show();
	elif(showing_ui):
		_player.position.x = 600;
		
		

func _on_resume_button_up() -> void:
	resume();

func _on_restart_button_up() -> void:
	resume();
	get_tree().reload_current_scene();

func _on_menu_button_up() -> void:
	resume();
	get_tree().change_scene_to_file("res://Scenes/ui/mainmenu.tscn");

func _on_quit_button_up() -> void:
	resume();
	get_tree().quit();

func _process(delta: float) -> void:
	checkPlayer();

func _ready() -> void:
	hide();
	
