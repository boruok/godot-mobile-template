class_name Progress extends UserData

@export var coins := 1000: set = set_coins

func set_coins(v: int) -> void:
	coins = v
	emit_changed()

func _init() -> void:
	_defaults = {
		"coins": 1000,
	}
