class_name MajorDamage

func execute(is_positive: bool):
	if is_positive:
		_positive_outcome()
	else:
		_negative_outcome()
		
func _positive_outcome():
	print("Cast a burst that deals immediate major damage to the opponent.")
	PlayerState.do_damage(4)
	
func _negative_outcome():
	print("Suffer immediate moderate damage yourself.")
	PlayerState.take_damage(2)
