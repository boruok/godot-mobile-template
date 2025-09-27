extends "popup.gd"

@export var _settings : Resource
@onready var _controller := OptionsController.new()

func _ready() -> void:
	%"MenuButton".button_down.connect(func(): open.emit("menu"))
	%"CloseButton".button_down.connect(func(): back.emit())

	_controller.settings = _settings
	_controller.music_node = $Window/VBoxContainer/MusicContainer/HSlider
	_controller.sound_node = $Window/VBoxContainer/SoundContainer/HSlider
	_controller.rotation_node = $Window/VBoxContainer/RotationButton
	_controller.vibration_node = $Window/VBoxContainer/VibrationButton
	_controller.language_node = $Window/VBoxContainer/HBoxContainer/LanguageButton
