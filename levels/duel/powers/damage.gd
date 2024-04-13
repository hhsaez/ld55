class_name Damage

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Cast a bolt that deals moderate damage to the opponent.")
	
func _negative_outcome():
	print("Accidentally shock yourself, dealing slight damage.")
	
