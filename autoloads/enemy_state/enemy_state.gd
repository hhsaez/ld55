extends Node

@export var max_health = 20

var health = 20

func reset():
	health = max_health

func is_alive():
	return health > 0

func do_damage(base_damage: int):
	PlayerState.take_damage(base_damage)
	
func take_damage(amount: int):
	health = max(0, health - amount)
	print("  Enemy takes ", amount, " points of damage (", health, " HP remaining)")
	
func heal(amount: int):
	health = min(health + amount, max_health)
	print("  Enemy heals for ", amount, " points (", health, " HP remaining)")

func dump_debug_info():
	if is_alive():
		print("* ENEMY: ", health, "/", max_health)
	else:
		print("* ENEMY IS DEAD")
