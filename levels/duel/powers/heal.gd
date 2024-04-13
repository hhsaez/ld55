class_name MajorHeal

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Heal yourself for a big amount.")
	
func _negative_outcome():
	print("Accidentally heal the opponent for a moderate amount.")
	
