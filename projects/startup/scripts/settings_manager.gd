extends Node

## Handles the settings file, applying settings everywhere, etc
var settings_dictionary : Dictionary

const SETTINGS_FILE_PATH = "user://settings.sav"
const DEFAULT_SETTINGS = {
	"resolution": [1920, 1080], 
	"vsync": true, 
	"fullscreen": false,
	"volume_master": 0.8,
	"volume_music": 0.8,
	"volume_sfx": 0.8,
} # Settings that are set by default, in case if settings file does not exist

func _ready():
	await load_settings_from_file()
	apply_settings()

## Applies settings from settings_dictionary
func apply_settings():
	apply_resolution_settings()
	apply_window_mode_settings()
	apply_vsync_settings()
	apply_audio_settings()

func apply_resolution_settings():
	var resolution : Vector2 = Vector2(settings_dictionary.resolution[0], settings_dictionary.resolution[1])
	DisplayServer.window_set_size(resolution)

	var window_size = DisplayServer.window_get_size()
	var screen_size = DisplayServer.screen_get_size()

	# Calculate the center position
	var center_x = (screen_size.x - window_size.x) / 2
	var center_y = (screen_size.y - window_size.y) / 2

	# Set the window position
	var window_position : Vector2 = Vector2(center_x, center_y)
	DisplayServer.window_set_position(window_position)

func apply_window_mode_settings():
	var window_mode = DisplayServer.WindowMode.WINDOW_MODE_WINDOWED

	if settings_dictionary.fullscreen:
		window_mode = DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN

	DisplayServer.window_set_mode(window_mode)
		
func apply_vsync_settings():
	var vsync_mode = DisplayServer.VSYNC_DISABLED

	if settings_dictionary.vsync:
		vsync_mode = DisplayServer.VSYNC_ENABLED

	DisplayServer.window_set_vsync_mode(vsync_mode)

func apply_audio_settings():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), settings_dictionary.volume_master)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), settings_dictionary.volume_music)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), settings_dictionary.volume_sfx)

## Loads settings from settings file
func load_settings_from_file():
	var file = FileAccess.open(SETTINGS_FILE_PATH, FileAccess.READ)
	if file == null:
		settings_dictionary = DEFAULT_SETTINGS
		save_settings_to_file()
		return

	settings_dictionary = JSON.parse_string(file.get_as_text())
	
	# if settings dict doesn't contain some keys, add them
	for key in DEFAULT_SETTINGS.keys():
		if not settings_dictionary.has(key):
			settings_dictionary[key] = DEFAULT_SETTINGS[key]

## Saves settings in settings file
func save_settings_to_file():
	var file = FileAccess.open(SETTINGS_FILE_PATH, FileAccess.WRITE)
	var json_string = JSON.stringify(settings_dictionary)
	file.store_string(json_string)

func get_resolution_as_str():
	
	var resolution_str = str(int(settings_dictionary.resolution[0])) + "x" + str(int(settings_dictionary.resolution[1]))
	
	return resolution_str
