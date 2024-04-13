class_name Shield

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Create a shield that absorbs a portion of incoming damage on the next turn.")
	
func _negative_outcome():
	print("Weaken your defenses, increasing damage taken on the next turn.")
	
