extends "popup.gd"

@export var _progress : Resource

func _on_YesButton_down() -> void:
	_progress.reset()
	back.emit()

func _ready() -> void:
	%"YesButton".button_down.connect(_on_YesButton_down)
	$"%NoButton".button_down.connect(func(): back.emit())
