extends Node

var config : Dictionary = {}

func _init() -> void:
	# Find all PCK/ZIP
	print("config initialized")
	config.main_menu_scene = "res://main_menu_placeholder.tscn"
	print("main menu scene " + config.main_menu_scene)
