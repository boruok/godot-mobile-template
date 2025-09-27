extends "base.gd"

@export var _settings : Resource
@onready var _controller := OptionsController.new()

func _ready() -> void:
	$BackButton.button_down.connect(_go_back_request)
	$VBoxContainer/ResetButton.button_down.connect(func(): open.emit("popup_reset"))

	_controller.settings = _settings
	_controller.music_node = $VBoxContainer/MusicContainer/HSlider
	_controller.sound_node = $VBoxContainer/SoundContainer/HSlider
	_controller.rotation_node = $VBoxContainer/RotationButton
	_controller.vibration_node = $VBoxContainer/VibrationButton
	_controller.language_node = $VBoxContainer/LanguageButton
