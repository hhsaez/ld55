extends Node2D

@onready var debug_output = $DebugOutput

var effects_dict = {
	"A": {
		"positive": "Cast a bolt that deals moderate damage to the opponent.",
		"negative": "Accidentally shock yourself, dealing slight damage.",
	},
	"B": {
		"positive": "Create a shield that absorbs a portion of incoming damage on the next turn.",
		"negative": "Weaken your defenses, increasing damage taken on the next turn.",
	},
	"C": {
		"positive": "Reflect a small percentage of damage back to the opponent for one turn.",
		"negative": "Reflect a small percentage of healing towards the opponent for one turn.",
	},
	"D": {
		"positive": "Heal yourself for a moderate amount.",
		"negative": "Accidentally heal the opponent for a smaller amount.",
	},
	"E": {
		"positive": "Enhance your next spell's damage.",
		"negative": "The next attack against you deals more damage (backfire effect).",
	},
	"F": {
		"positive": "Reduce the damage of the next attack against you (temporary resistance).",
		"negative": "Increase the damage of the next attack against you (vulnerability).",
	},
	"G": {
		"positive": "Inflict a mild continuous damage on the opponent over three turns (poison).",
		"negative": "Suffer mild continuous damage yourself over three turns.",
	},
	"H": {
		"positive": "Cast a burst that deals immediate moderate damage to the opponent.",
		"negative": "Suffer immediate slight damage yourself.",
	},
	"I": {
		"positive": "Temporarily increase the damage of your spells for a short duration.",
		"negative": "Temporarily decrease the effectiveness of your healing spells.",
	},
}

func _on_grid_cells_selected(cells):
	var pattern = ",".join(cells)
	var effects = []
	var is_positive = true
	for cell_name in cells:
		if is_positive:
			effects.append(effects_dict[cell_name]["positive"])
		else:
			effects.append(effects_dict[cell_name]["negative"])
		is_positive = not is_positive
	effects = "\n".join(effects)
	debug_output.text = pattern + "\n" + effects
