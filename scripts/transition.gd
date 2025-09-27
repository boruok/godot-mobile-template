extends CanvasLayer

@export var duration := 0.5

func play(sequence: String) -> void:
	var c_rect := $ColorRect

	if sequence == "in":
		c_rect.visible = true
		await create_tween().tween_property(c_rect, "color:a", 1.0, duration).finished
	elif sequence == "out":
		await create_tween().tween_property(c_rect, "color:a", 0.0, duration).finished
		c_rect.visible = false
