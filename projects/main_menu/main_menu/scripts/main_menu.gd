extends Control

@onready var buttons = $VBoxContainer

## This template does not supply loading screens, so you have to make one yourself
func _play() -> void:
	print("Play")
	var game_scene = "res://main_menu/game_placeholder.tscn"
	# set the game scene from the config manager if it exists
	var config_manager = get_tree().root.get_node_or_null("ConfigManager")
	if config_manager != null and config_manager.config.has("game_scene"):
		game_scene = config_manager.config.game_scene
	get_tree().change_scene_to_file(game_scene)

func _quit() -> void:
	self.get_tree().quit()

func hide_buttons() -> void:
	buttons.hide()
	
func show_buttons() -> void:
	buttons.show()
