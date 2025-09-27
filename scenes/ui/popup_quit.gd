extends "popup.gd"

func _on_YesButton_down() -> void:
	get_tree().quit()

func _ready() -> void:
	%"YesButton".button_down.connect(_on_YesButton_down)
	%"NoButton".button_down.connect(func(): back.emit())
