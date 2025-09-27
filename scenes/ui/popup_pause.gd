extends "popup.gd"

export var _settings : Resource
onready var _controller := OptionsController.new()

func _ready() -> void:
	$"%MenuButton".connect("button_down", self, "emit_signal", ["open", "menu"])
	$"%CloseButton".connect("button_down", self, "emit_signal", ["back"])

	_controller.settings = _settings
	_controller.music_node = $Window/VBoxContainer/MusicContainer/HSlider
	_controller.sound_node = $Window/VBoxContainer/SoundContainer/HSlider
	_controller.rotation_node = $Window/VBoxContainer/RotationButton
	_controller.vibration_node = $Window/VBoxContainer/VibrationButton
	_controller.language_node = $Window/VBoxContainer/HBoxContainer/LanguageButton
