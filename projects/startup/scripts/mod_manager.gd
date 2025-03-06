extends Node

const MOD_DIR = "mods"
var mod_order: Array[String] = []

func _init() -> void:
	if not OS.has_feature("editor"):
		initialize_mod_system()
	else:
		print("Startup Initialized, skipping mod load while in editor, try testing your mods individually and then test them all together by exporting and building them")

func initialize_mod_system() -> void:
	print("Initializing mod system")
	var yaml_path = OS.get_executable_path().get_base_dir().path_join(MOD_DIR).path_join("mod_order.yaml")
	print("Looking for mod_order.yaml at: " + yaml_path)
	var parsed = YamlParser.parse_file(yaml_path)
	if parsed and parsed.has("mods"):
		print("Found mod_order.yaml with " + str(parsed.mods.size()) + " mods")
		# Replace map function with simple loop
		mod_order = []
		for mod in parsed.mods:
			mod_order.append(str(mod))
	else:
		push_warning("No mod_order.yaml found at " + yaml_path + " - mods will be loaded in alphabetical order")
		mod_order = []
	
	load_mods()

func load_mods() -> void:
	print("Starting to load mods")
	var scan_path = OS.get_executable_path().get_base_dir().path_join(MOD_DIR)
	print("Scanning for mods in: " + scan_path)
	var all_files: Array[String] = []
	
	# Check if the directory exists
	var dir = DirAccess.open(scan_path)
	if dir == null:
		push_error("Mod directory does not exist: " + scan_path)
		return
	
	FileManager.get_all_files(all_files, scan_path)
	var mod_files = all_files.filter(func(path): return path.get_extension() == "zip")
	print("Found " + str(mod_files.size()) + " mod zip files")
	
	if mod_files.is_empty():
		push_error("No mod zip files found in " + scan_path)
		return
		
	# Sort mods according to order
	if not mod_order.is_empty():
		var unordered = mod_files.filter(func(path): return not mod_order.has(path.get_file().split(".")[0]))
		
		var ordered_mods = []
		for name in mod_order:
			print("Looking for mod: " + name)
			var matching_mods = mod_files.filter(func(path): return path.get_file().split(".")[0] == name)
			if matching_mods.size() > 0:
				ordered_mods.append(matching_mods[0])
			else:
				print("Warning: Mod " + name + " specified in mod_order.yaml was not found")
		
		mod_files = ordered_mods
		mod_files.append_array(unordered)
	else:
		print("No mod order specified, loading in alphabetical order")
	
	# Load mods
	for path in mod_files:
		print("Loading mod from: " + path)
		if ProjectSettings.load_resource_pack(path, true):
			var mod_name = path.get_file().split(".")[0]
			print("Successfully loaded mod: " + mod_name + ", instantiating scene")
			
			var init_scene_path = "res://" + mod_name + "/init_scene.tscn"
			print("Looking for init scene at: " + init_scene_path)
			
			var scene = load(init_scene_path)
			if scene:
				var instance = scene.instantiate()
				add_child(instance)
				print("Added " + mod_name + " to scene tree")
			else:
				push_error("Failed to load init scene for mod: " + mod_name + " at path: " + init_scene_path)
		else:
			push_error("Failed to load mod from: " + path)

func _ready() -> void:
	print("ModManager is ready, deferring main menu load")
	call_deferred("load_main_menu")

func load_main_menu() -> void:
	print("Loading main menu: " + ConfigManager.config.main_menu_scene)
	get_tree().change_scene_to_file(ConfigManager.config.main_menu_scene)
