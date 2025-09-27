extends Control

signal open(scene, data)
signal back(data)

func _on_popup_opened() -> void:
	pass

func _on_popup_closed(data:={}) -> void:
	pass

func _go_back_request() -> void:
	emit_signal("back")
