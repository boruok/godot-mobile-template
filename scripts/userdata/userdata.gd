class_name UserData extends Resource

enum { MODE_SAVE = 0, MODE_LOAD = 1, EXPORTED_PROPERTY = 8199 }
@export var filepath := "" # (String, FILE)
var _defaults := {}

func init() -> void:
	if FileAccess.file_exists(filepath):
		_open(MODE_LOAD)
	else:
		reset() # apply default values
		_open(MODE_SAVE)

func exit() -> void:
	_open(MODE_SAVE)

# resets props to default values
func reset() -> void:
	for k in _defaults: set(k, _defaults[k])

func _open(mode: int) -> void:
	match mode:
		MODE_SAVE:
			# build
			var dict := {}
			for p in get_property_list():
				if p.name == "filepath":
					continue
				if p.usage == EXPORTED_PROPERTY:
					dict[p.name] = get(p.name)

			# save
			var file := FileAccess.open(filepath, FileAccess.WRITE)
			file.store_var(dict)
		MODE_LOAD:
			var file := FileAccess.open(filepath, FileAccess.READ)
			var dict := file.get_var() as Dictionary
			for k in dict: set(k, dict[k])
