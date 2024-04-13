extends Node2D

@export var debug = false

signal cells_selected(cells)

var cells = []
var selected_cells = []

# Called when the node enters the scene tree for the first time.
func _ready():
	cells = [$A, $B, $C, $D, $E]
	for cell in cells:
		cell.debug = debug

func get_cells():
	return cells.duplicate()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if selected_cells.size() >= 2:
			cells_selected.emit(selected_cells)
		selected_cells = []

func _on_cell_hovered(cell):
	if not selected_cells.is_empty():
		if selected_cells[selected_cells.size() - 1] == cell.name:
			return
	selected_cells.append(cell.name)
