extends Control

@onready var resolution_button: OptionButton = $ResolutionButton
@onready var fullscreen_toggle: CheckBox = $FullscreenToggle
@onready var v_sync_toggle: CheckBox = $VSyncToggle

@onready var master_scroll_bar: HScrollBar = $SlidersVbox/MasterScrollBar
@onready var music_scroll_bar: HScrollBar = $SlidersVbox/MusicScrollBar
@onready var sfx_scroll_bar: HScrollBar = $SlidersVbox/SFXScrollBar

@export var min_volume: float = -80
@export var max_volume: float = 6

# Define a signal that can be bound to
signal settings_closed

func _ready():
	for i in range(4):
		var text = resolution_button.get_item_text(i)
		var r = SettingsManager.get_resolution_as_str()
		if text == r:
			resolution_button.selected = i
			break
	fullscreen_toggle.button_pressed = SettingsManager.settings_dictionary.fullscreen
	v_sync_toggle.button_pressed = SettingsManager.settings_dictionary.vsync
	master_scroll_bar.value = inverse_lerp(min_volume, max_volume, SettingsManager.settings_dictionary.volume_master)
	music_scroll_bar.value = inverse_lerp(min_volume, max_volume, SettingsManager.settings_dictionary.volume_music)
	sfx_scroll_bar.value = inverse_lerp(min_volume, max_volume, SettingsManager.settings_dictionary.volume_sfx)

func _on_apply_settings() -> void:
	var resolution = resolution_button.get_item_text(resolution_button.selected)
	var fullscreen = fullscreen_toggle.button_pressed
	var vsync = v_sync_toggle.button_pressed
	resolution = resolution.split("x")
	resolution = [int(resolution[0]), int(resolution[1])]
	SettingsManager.settings_dictionary.resolution = resolution
	SettingsManager.settings_dictionary.vsync = vsync
	SettingsManager.settings_dictionary.fullscreen = fullscreen
	
	SettingsManager.apply_settings()
	SettingsManager.save_settings_to_file()
	emit_signal("settings_closed")

func _on_master_scroll_bar_value_changed(value: float) -> void:
	SettingsManager.settings_dictionary.volume_master = convert_volume_to_db(value)
	SettingsManager.apply_audio_settings()

func _on_music_scroll_bar_value_changed(value: float) -> void:
	SettingsManager.settings_dictionary.volume_music = convert_volume_to_db(value)
	SettingsManager.apply_audio_settings()

func _on_sfx_scroll_bar_value_changed(value: float) -> void:
	SettingsManager.settings_dictionary.volume_sfx = convert_volume_to_db(value)
	SettingsManager.apply_audio_settings()

func convert_volume_to_db(value: float) -> float:
	# return range from 6 to -80 based off of value that goes from 0.0 to 1.0
	return lerp(min_volume, max_volume, value)
