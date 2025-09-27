extends "base.gd"

func _go_back_request() -> void:
	emit_signal("open", "popup_pause")

func _ready() -> void:
	$PauseButton.connect("button_down", self, "_go_back_request")

func _process(delta: float) -> void:
	pass
