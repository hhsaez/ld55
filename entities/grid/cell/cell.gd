extends Node2D

signal hovered(which: Node2D)

var last_mouse_position = Vector2()
var is_mouse_over = false

@onready var timer = $Timer
@onready var color_rect = $ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	var collision_shape = $Area2D.get_child(0) as CollisionShape2D
	var shape = collision_shape.shape
	if shape is RectangleShape2D:
		color_rect.size = shape.size
	var r = randf()
	var g = randf()
	var b = randf()
	color_rect.color = Color(r, g, b, 1)
	color_rect.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseMotion:
		last_mouse_position = event.position
		# Reset the timer whenever the mouse moves
		timer.stop()
		timer.start()
		color_rect.visible = false

func _on_area_2d_mouse_entered():
	is_mouse_over = true
	last_mouse_position = get_viewport().get_mouse_position()
	timer.start()

func _on_area_2d_mouse_exited():
	is_mouse_over = false
	timer.stop()

func _on_timer_timeout():
	if is_mouse_over && last_mouse_position == get_viewport().get_mouse_position():
		color_rect.visible = true
		hovered.emit(self)
		
#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
#		hovered.emit(self)
