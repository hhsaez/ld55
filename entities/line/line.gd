extends Line2D

var is_drawing = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				is_drawing = true
				points = [event.position]
			else:
				is_drawing = false
	elif event is InputEventMouseMotion:
		if is_drawing:
			add_point(event.position)
