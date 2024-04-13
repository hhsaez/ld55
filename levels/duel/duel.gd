extends Node2D

@export var symbol_scene: PackedScene

func _ready():
	_render_new_pattern()

func _render_new_pattern():
	var symbol = symbol_scene.instantiate()
	add_child(symbol)
	symbol.position = Vector2(randi_range(10, get_viewport_rect().size.x - 500), randi_range(10, get_viewport_rect().size.y - 500))
	symbol.symbol_completed.connect(_render_new_pattern)
