extends Control

func resume():
	hide();
	get_tree().paused = false;

func pause():
	show();
	get_tree().paused = true;

func onEsc():
	if Input.is_action_just_pressed("esc"):
		if get_tree().paused:
			resume();
		else:
			pause();		

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
	onEsc();

func _ready() -> void:
	hide();
