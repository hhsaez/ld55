class_name Condition

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Inflict a mild continuous damage on the opponent over three turns (poison).")
	
func _negative_outcome():
	print("Suffer mild continuous damage yourself over three turns.")
	
