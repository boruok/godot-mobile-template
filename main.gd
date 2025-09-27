extends Node

export(Array, Resource) var _userdata

func _enter_tree() -> void:
	for r in _userdata:
		r.init()

func _exit_tree() -> void:
	for r in _userdata:
		r.exit()
