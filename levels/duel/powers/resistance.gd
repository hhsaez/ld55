class_name Resistance

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Reduce the damage of the next attack against you (temporary resistance).")
	
func _negative_outcome():
	print("Increase the damage of the next attack against you (vulnerability).")
	
