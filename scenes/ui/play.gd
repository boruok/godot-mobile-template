extends "base.gd"

func _go_back_request() -> void:
	open.emit("popup_pause")

func _ready() -> void:
	$PauseButton.button_down.connect(_go_back_request)
