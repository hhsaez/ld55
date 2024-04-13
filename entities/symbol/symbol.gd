extends Node2D

signal symbol_completed
signal symbol_expired

var to_match = ""

func _ready():
	var cells = $Grid.get_cells()
	cells.shuffle()	
	var moves = randi_range(3, cells.size())
	var points = []
	for i in range(moves):
		var cell_name = cells[i].name
		to_match += cell_name
		var start = cells[i].position
		points.append(start + Vector2(randi_range(0, 20), randi_range(0, 20)))
	$PatternToMatch.points = points

func _on_grid_cells_selected(cells):
	var player_pattern = "".join(cells)
	if player_pattern == to_match or player_pattern.reverse() == to_match:
		$PatternToMatch.default_color = Color(0, 1, 0, 1)
		$DestroyTimer.start()
	else:
		$PatternToMatch.default_color = Color(1, 0, 0, 1)
	$PlayerLine.get_child(0).points = []

func _on_destroy_timer_timeout():
	symbol_completed.emit()
	queue_free()
