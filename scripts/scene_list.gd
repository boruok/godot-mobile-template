class_name SceneList extends Resource

@export var _list : Array[SceneEntry]

func get_scene(scene_id: String) -> Node:
	for e in _list:
		if e._id == scene_id:
			return e._scene.instantiate()
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
