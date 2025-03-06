extends Button

@onready var settings_menu_scene : Node = load("res://settings_menu/settings_menu.tscn").instantiate()
var settings_manager_scene : Node

func _ready() -> void:
	print("settings button ready")

	# Bind to signal settings_closed in settings_menu_scene
	settings_menu_scene.connect("settings_closed", Callable(self, "_on_settings_closed"))

func _on_pressed() -> void:
	get_parent().hide()
	get_tree().root.add_child(settings_menu_scene)

func _on_settings_closed() -> void:
	get_parent().show()
	print("settings closed")
	get_tree().root.remove_child(settings_menu_scene)
