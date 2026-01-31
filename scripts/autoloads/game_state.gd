extends Node
## Global game state manager handling turn progression and game time tracking.
##
## This autoload singleton maintains the core game state including the current turn counter
## and game time (day/month/year). It provides the advance_turn() method for turn progression
## and emits signals when turns advance.

var current_turn: int = 0
var game_time: Dictionary = {"day": 0, "month": 1, "year": 1}

signal turn_advanced(turn_number: int)


func advance_turn() -> void:
	"""Advance to the next turn, update game time, and emit signals."""
	current_turn += 1
	_update_game_time()
	turn_advanced.emit(current_turn)
	GameEvents.turn_completed.emit(current_turn)


func _update_game_time() -> void:
	"""Update game time using 10 days per turn with month/year rollover."""
	game_time.day += 10

	# Roll over to next month
	if game_time.day >= 30:
		game_time.day -= 30
		game_time.month += 1

	# Roll over to next year
	if game_time.month > 12:
		game_time.month -= 12
		game_time.year += 1


func get_time_display() -> String:
	"""Get formatted time display string."""
	return "Turn %d (Day %d, Month %d, Year %d)" % [
		current_turn,
		game_time.day,
		game_time.month,
		game_time.year
	]


func reset() -> void:
	"""Reset game state to initial values."""
	current_turn = 0
	game_time = {"day": 0, "month": 1, "year": 1}
