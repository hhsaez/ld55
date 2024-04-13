class_name Reflect

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Reflect a small percentage of damage back to the opponent for one turn.")
	
func _negative_outcome():
	print("Reflect a small percentage of healing towards the opponent for one turn.")
	
