class_name ScreenManager extends Manager

signal scene_changed(from: String, to: String)
signal popup_opened
signal popup_closed

@export var _scene_list : Resource
@export var _transition_path : NodePath
@export var _container_path : NodePath

var _transition : Node # transition node
var _container : Node  # scenes container node

var _current : Control # current ui
var _history := []     # holds list of ids ["logo", "menu", "play"]
var _blocked := false  # transition block

func set_current(current: Control, id: String) -> void:
	_current = current
	_current.connect("open", Callable(self, "_on_open"))
	_current.connect("back", Callable(self, "_on_back"))
	if !id in _history: _history.append(id)

func _on_open(id: String, data:={}) -> void:
	if !_scene_list.has_scene(id) or _blocked:
		return # check for errors

	_blocked = true # block activity

	# check if we switching for popups to main
	if _scene_list.is_scene_popup(_history.back()) and !_scene_list.is_scene_popup(id):
		if _transition: await _transition.play("in")
		for i in range(_history.size()-1, -1, -1):
			if _history[i] == id:
				break
			_history.remove_at(i)
			_container.get_child(_container.get_child_count() - i + 1).queue_free()

	if _scene_list.is_scene_popup(id):
		_current._on_popup_opened()
		popup_opened.emit()
	else:
		if _transition: await _transition.play("in")
		if is_instance_valid(_current):
			_current.queue_free()

	var instance := _scene_list.get_scene(id) as Control
	for k in data: instance[k] = data[k]
	_container.add_child(instance)
	set_current(instance, id)

	if !_scene_list.is_scene_popup(id) and _transition:
		await _transition.play("out")

	_blocked = false # unlock activity

func _on_back(data:={}) -> void:
	if _scene_list.is_scene_popup(_history.back()):
		_current.queue_free()
		_current = _container.get_child(_container.get_child_count()-2)
		_current._on_popup_closed(data)
		_history.pop_back()
		popup_closed.emit()
	else:
		_history.pop_back()
		_on_open(_history.back(), data)

func _ready() -> void:
	# init manager
	_container = get_node_or_null(_container_path)
	if !_container: _container = self
	_transition = get_node_or_null(_transition_path)
	var current := _container.get_child(0)
	set_current(current, current.name.to_lower())

func _notification(what: int) -> void:
	# call current node go_back_request-method on go_back-gesture
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_current._go_back_request()
