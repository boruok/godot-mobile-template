extends Node

func _ready() -> void:
	if !OS.is_debug_build():
		queue_free() # delete debug-node in release builds

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_ESCAPE:
				get_tree().quit()
			elif event.scancode == KEY_F2:
				get_tree().reload_current_scene()
			elif event.scancode == KEY_F3:
				get_tree().debug_collisions_hint = !get_tree().debug_collisions_hint
				get_tree().reload_current_scene()
			elif event.scancode == KEY_F4:
				get_tree().debug_navigation_hint = !get_tree().debug_navigation_hint
				get_tree().reload_current_scene()
			elif event.scancode == KEY_F11:
				var window_size := OS.window_size
				OS.window_size = Vector2(window_size.y, window_size.x)
				OS.window_position = OS.get_screen_size() / 2 - OS.window_size / 2
			elif event.scancode == KEY_BACKSPACE:
				get_tree().current_scene.propagate_notification(NOTIFICATION_WM_GO_BACK_REQUEST)
