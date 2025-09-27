extends "base.gd"

var _last_touch := Vector2()

func _go_back_request() -> void:
	emit_signal("open", "popup_quit")

func _ready() -> void:
	$OptionsButton.connect("button_down", self, "emit_signal", ["open", "options"])
	$InstructionsLabel.connect("gui_input", self, "_on_Istruction_gui_input")

func _process(delta: float) -> void:
	if Engine.get_frames_drawn() % 30 == 0:
		$InstructionsLabel.visible = !$InstructionsLabel.visible

func _on_Istruction_gui_input(event: InputEvent) -> void:
	# check if use cicked and released in same coord
	if event is InputEventScreenTouch:
		if event.pressed:
			_last_touch = event.position
		else:
			if _last_touch == event.position:
				emit_signal("open", "play")
