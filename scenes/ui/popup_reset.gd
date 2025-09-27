extends "popup.gd"

export var _progress : Resource

func _on_YesButton_down() -> void:
	_progress.reset()
	emit_signal("back")

func _ready() -> void:
	$"%YesButton".connect("button_down", self, "_on_YesButton_down")
	$"%NoButton".connect("button_down", self, "emit_signal", ["back"])
