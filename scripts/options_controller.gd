class_name OptionsController extends Reference
# class for handling options/settings changing and applying.
# script represented as separate class to avoid code duplication

var settings : Resource

var music_node : HSlider setget set_music_node
var sound_node : HSlider setget set_sound_node
var rotation_node : Button setget set_rotation_node
var vibration_node : Button setget set_vibration_node
var language_node : Button setget set_language_node

func set_music_node(v: HSlider) -> void:
	music_node = v
	music_node.value = settings.music
	music_node.connect("drag_ended", self, "_on_Music_drag_ended")

func set_sound_node(v: HSlider) -> void:
	sound_node = v
	sound_node.value = settings.sound
	sound_node.connect("drag_ended", self, "_on_Sound_drag_ended")

func set_rotation_node(v: CheckButton) -> void:
	rotation_node = v
	rotation_node.pressed = settings.rotation
	rotation_node.connect("toggled", self, "_on_Rotation_toggled")

func set_vibration_node(v: CheckButton) -> void:
	vibration_node = v
	vibration_node.pressed = settings.vibration
	vibration_node.connect("toggled", self, "_on_Vibration_toggled")

func set_language_node(v: Button) -> void:
	language_node = v
	language_node.text = tr("UI_%s" % settings.get_locale_next().to_upper())
	language_node.connect("button_down", self, "_on_Language_button_down")

func _on_Music_drag_ended(v: bool) -> void:
	if v: settings.music = music_node.value

func _on_Sound_drag_ended(v: bool) -> void:
	if v: settings.sound = sound_node.value

func _on_Rotation_toggled(v: bool) -> void:
	settings.rotation = v

func _on_Vibration_toggled(v: bool) -> void:
	settings.vibration = v

func _on_Language_button_down() -> void:
	settings.set_locale_next()
	language_node.text = tr("UI_%s" % settings.get_locale_next().to_upper())
