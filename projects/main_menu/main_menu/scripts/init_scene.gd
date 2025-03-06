extends Node

func _init() -> void:
	print("main menu mod init")


func _ready() -> void:
	print("main menu mod ready")
	
	# Update config manager with the name of the main menu scene for the main project to launch
	# If we're in the editor, we won't have a ConfigManager, so just launch the main menu directly
	if OS.has_feature("editor"):
		launch_main_menu()
	else:
		# set the main menu scene in the config manager
		var config_manager = get_tree().root.get_node_or_null("ConfigManager")
		if config_manager != null:
			config_manager.config.main_menu_scene = "res://main_menu/main_menu.tscn"
		else:
			printerr("main menu mod - could not find config manager")

func launch_main_menu() -> void:
	var main_menu_scene : String = "res://main_menu/main_menu.tscn"
	get_tree().change_scene_to_file(main_menu_scene)
