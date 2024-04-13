class_name EnhanceNext

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Enhance your next spell's damage.")
	
func _negative_outcome():
	print("The next attack against you deals more damage (backfire effect).")
	
