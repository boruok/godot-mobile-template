extends Node

@export var _userdata : Array[UserData]

func _enter_tree() -> void:
	for r in _userdata:
		r.init()

func _exit_tree() -> void:
	for r in _userdata:
		r.exit()
