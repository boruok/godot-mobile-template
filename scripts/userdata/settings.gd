class_name Settings extends UserData

const FALLBACK_LOCALE := "en"

@export var music := 50: set = set_music
@export var sound := 50: set = set_sound
@export var rotation := true: set = set_rotation
@export var vibration := true: set = set_vibration
@export var locale := "": set = set_locale

func set_music(v: int) -> void:
	music = v
	emit_changed()

func set_sound(v: int) -> void:
	sound = v
	emit_changed()

func set_rotation(v: bool) -> void:
	rotation = v
	DisplayServer.screen_set_orientation(DisplayServer.SCREEN_PORTRAIT if v else DisplayServer.SCREEN_REVERSE_LANDSCAPE)
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
	# try to match loaded locales to system locale, use fallback locale if not matched
	if locale.is_empty():
		var system := OS.get_locale().get_slice("_", 0)
		for loaded in TranslationServer.get_loaded_locales():
			if loaded == system:
				locale = system
				break
		locale = FALLBACK_LOCALE
	print(locale, locale.length())
	TranslationServer.set_locale(locale) # apply locale

func _init() -> void:
	_defaults = {
		"music": 50,
		"sound": 50,
		"rotation": true,
		"vibration": true,
		"locale": "",
}
