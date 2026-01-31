extends Node
## Global event bus for decoupled cross-system communication.
##
## This autoload singleton provides signals that different game systems can emit and listen to
## without requiring direct references. This enables loose coupling between systems.

# Turn signals
signal turn_completed(turn_number: int)
signal turn_started(turn_number: int)

# Save/load signals
signal game_saved()
signal game_loaded()

# Game event signals (for logging and notifications)
signal production_occurred(factory_name: String, item_name: String, quantity: int)
signal delivery_made(item_name: String, quantity: int, destination: String)

# UI signals
signal notification_requested(message: String, type: String)
signal log_entry_added(text: String)
