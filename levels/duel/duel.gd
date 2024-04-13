extends Node2D

var all_effects = {
	"A": Damage.new(),
	"B": Shield.new(),
	"C": Reflect.new(),
	"D": Heal.new(),
	"E": EnhanceNext.new(),
	"F": Resistance.new(),
	"G": Condition.new(),
	"H": MajorDamage.new(),
	"I": MajorHeal.new(),
}

func _ready():
	PlayerState.reset()
	EnemyState.reset()

func _on_grid_cells_selected(cells):
	print("---- BEGIN ----")
	print("Pattern: ", ",".join(cells))
	
	var is_positive = true
	for cell_name in cells:
		if not all_effects.has(cell_name):
			push_error("Unknown effect name: ", cell_name)
			continue
		var effect = all_effects[cell_name]
		effect.execute(is_positive)
		is_positive = not is_positive
	
	PlayerState.dump_debug_info()
	EnemyState.dump_debug_info()
		
	print("---- END ----")
