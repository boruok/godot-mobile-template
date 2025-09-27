tool
class_name SceneList extends Resource

export(Array, Resource) var _list setget set_list

func set_list(value: Array) -> void:
	# workaround, godot 3 poorly supports array of custom classes
	_list.resize(value.size())
	_list = value
	for i in _list.size():
		if !_list[i]:
			_list[i] = SceneEntry.new()

func get_scene(scene_id: String) -> Node:
	for e in _list:
		if e._id == scene_id:
			return e._scene.instance()
	return null

func has_scene(scene_id: String) -> bool:
	for e in _list:
		if e._id == scene_id:
			return true
	return false

func is_scene_popup(scene_id: String) -> bool:
	for e in _list:
		if e._id == scene_id and e._popup:
			return true
	return false
