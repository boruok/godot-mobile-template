extends Node

func _ready() -> void:
	if !OS.is_debug_build():
		queue_free() # delete debug-node in release builds

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ESCAPE:
				get_tree().quit()
			elif event.keycode == KEY_F2:
				get_tree().reload_current_scene()
			elif event.keycode == KEY_F3:
				get_tree().debug_collisions_hint = !get_tree().debug_collisions_hint
				get_tree().reload_current_scene()
			elif event.keycode == KEY_F4:
				get_tree().debug_navigation_hint = !get_tree().debug_navigation_hint
				get_tree().reload_current_scene()
			elif event.keycode == KEY_F11:
				var window_size := get_window().size
				get_window().size = Vector2(window_size.y, window_size.x)
				get_window().position = DisplayServer.screen_get_size() / 2 - get_window().size / 2
			elif event.keycode == KEY_BACKSPACE:
				get_tree().current_scene.propagate_notification(NOTIFICATION_WM_GO_BACK_REQUEST)
