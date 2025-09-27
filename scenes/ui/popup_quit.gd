extends "popup.gd"

func _on_YesButton_down() -> void:
	get_tree().quit()

func _on_NoButton_down() -> void:
	emit_signal("back")

func _ready() -> void:
	$"%YesButton".connect("button_down", self, "_on_YesButton_down")
	$"%NoButton".connect("button_down", self, "_on_NoButton_down")
