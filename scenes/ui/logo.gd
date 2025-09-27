extends "base.gd"

func _ready() -> void:
	yield(get_tree().create_timer(1), "timeout")
	emit_signal("open", "menu")
