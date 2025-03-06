extends Node

var settings_dictionary : Dictionary = {
	"resolution": [1280, 720],
	"vsync": true,
	"fullscreen": false,
	"volume_master": 0.8,
	"volume_music": 0.8,
	"volume_sfx": 0.8
}

func get_resolution_as_str() -> String:
	return "1280x720"

func apply_settings():
	print("placeholder apply_settings")

func save_settings_to_file():
	print("placeholder save_settings")

func apply_audio_settings():
	print("placeholder apply_audio_settings")
