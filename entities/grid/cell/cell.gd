extends Node2D

signal hovered(which: Node2D)

var is_mouse_hovering = false

@onready var color_rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	var collision_shape = $Area2D.get_child(0) as CollisionShape2D
	var shape = collision_shape.shape
	if shape is RectangleShape2D:
		color_rect.size = shape.size
	elif shape is CircleShape2D:
		color_rect.size = Vector2(2 * shape.radius, 2 * shape.radius)
	var r = randf()
	var g = randf()
	var b = randf()
	color_rect.color = Color(r, g, b, 1)
	color_rect.visible = false
	
func _process(delta):
	color_rect.visible = is_mouse_hovering
	if is_mouse_hovering and Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		hovered.emit(self)

func _on_area_2d_mouse_entered():
	is_mouse_hovering = true

func _on_area_2d_mouse_exited():
	is_mouse_hovering = false
