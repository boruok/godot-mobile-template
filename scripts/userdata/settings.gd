class_name Settings extends UserData

const FALLBACK_LOCALE := "en"

export var music := 50 setget set_music
export var sound := 50 setget set_sound
export var rotation := true setget set_rotation
export var vibration := true setget set_vibration
export var locale := "" setget set_locale

func set_music(v: int) -> void:
	music = v
	emit_changed()

func set_sound(v: int) -> void:
	sound = v
	emit_changed()

func set_rotation(v: bool) -> void:
	rotation = v
	OS.screen_orientation = OS.SCREEN_ORIENTATION_PORTRAIT if v else OS.SCREEN_ORIENTATION_REVERSE_LANDSCAPE
	emit_changed()

func set_vibration(v: bool) -> void:
	vibration = v
	if v: Input.vibrate_handheld(50)
	emit_changed()

func set_locale(v: String) -> void:
	locale = v
	TranslationServer.set_locale(locale)
	emit_changed()

func set_locale_next() -> void:
	var locales := TranslationServer.get_loaded_locales()
	var idx := locales.find(locale)
	idx += 1
	idx %= locales.size()
	set_locale(locales[idx])

func get_locale_next() -> String:
	var locales := TranslationServer.get_loaded_locales()
	var idx := locales.find(locale)
	return locales[(idx + 1) % locales.size()]

func init() -> void:
	.init()

	# try to match loaded locales to system locale, use fallback locale if not matched
	if locale.empty():
		var system := OS.get_locale().get_slice("_", 0)
		for loaded in TranslationServer.get_loaded_locales():
			if loaded == system:
				locale = system
				break
		locale = FALLBACK_LOCALE
	TranslationServer.set_locale(locale) # apply locale

func _init() -> void:
	_defaults = {
		"music": 50,
		"sound": 50,
		"rotation": true,
		"vibration": true,
		"locale": "",
}
