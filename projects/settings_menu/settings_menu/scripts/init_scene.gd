extends Node

@onready var settings_button_scene : Node = load("res://settings_menu/settings_button.tscn").instantiate()

func _init() -> void:
	print("settings menu mod init")

func _ready() -> void:
	print("settings menu mod ready")

	# Bind to a function when a new scene is loaded
	get_tree().root.connect("child_entered_tree", Callable(self, "_on_child_entered_tree"))
	
	# recursive_print_nodes(get_tree().root)

func _on_child_entered_tree(node: Node) -> void:
	# print("Node entered: " + node.name)
	# recursive_print_nodes(get_tree().root)

	if node.name == "MainMenu":
		print("Main Menu entered")
		inject_settings_button_into_main_menu_list()

func inject_settings_button_into_main_menu_list() -> void:
	var main_menu = get_tree().root.get_node("MainMenu/VBoxContainer")
	main_menu.add_child(settings_button_scene)
	main_menu.move_child(settings_button_scene, 1)

	# recursive_print_nodes(get_tree().root)

# List each node in the scene starting from root
# TODO: Move to utils class
func recursive_print_nodes(node: Node, indent: int = 0) -> void:
	var indent_str = ""
	for i in range(indent):
		indent_str += "  "
	print(indent_str + node.name)
	for child in node.get_children():
		recursive_print_nodes(child, indent + 1)
