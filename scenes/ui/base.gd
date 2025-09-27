extends Control

signal open(scene: String, data: Dictionary)
signal back(data: Dictionary)

func _on_popup_opened() -> void:
	pass

func _on_popup_closed(data:={}) -> void:
	pass

func _go_back_request() -> void:
	back.emit()
