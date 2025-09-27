## Godot Mobile Template

Example/Template project for games based on Godot Engine.

### Features
1. Manager for handling ui:
	- one main ui (logo, menu, play, options) at time.
	- popups with popups.
2. Debug-node for handling:
	- quit.
	- reload.
	- toggle collision and navigation draw.
	- screen rotation.
	- go_back-gesture emulation.
3. UserData:
	1. Settings:
		- music.
		- sound.
		- rotation.
		- vibration.
		- language.
	2. Progress:
		- coins.
4. Tranlation:
	- en, ru
5. Transition(optional):
	- basic fade in/out

### UI

#### Open new UI

```gdscript
func _ready() -> void:
	emit_signal("open", "play")
```

you can also pass some data to next UI:

```gdscript
func _ready() -> void:
	emit_signal("open", "play", {"coins": 100, "next_level": "underworld"})
```

> If the next ui is not a popup, it will be destroyed automatically.

#### Jumping to previous UI or closing popup

```
func _ready() -> void:
	emit_signal("back")
```

you can also pass some data for previous ui:

```
func _ready() -> void:
	emit_signal("back", {"message": "game over", "score": 100})
```

> For example, if history was ["logo", "menu", "play"], emitting back-signal transitions to `menu` and erases `play`.

### UserData

> Settings and Progress automatically saves and loads when loading and exiting game.

#### Defining save/load variable

Here rules:

1. all user defined and expoted variables (8199) are automaticall saves and loads at runtime.
2. `defaults` variable holds default-values of variables (useful for `reset progress`).

```gdscript
export var coins := 1000

func _init() -> void:
	_defaults = {
		"coins": 1000,
	}
```
