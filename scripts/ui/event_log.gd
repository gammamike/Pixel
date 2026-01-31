extends PanelContainer
## Event log controller that listens to GameEvents signals and displays event history.
##
## This controller maintains a scrolling log of game events like turn completions,
## production, deliveries, and custom log entries. The log auto-scrolls to show
## the newest entries and supports BBCode formatting for colors and emphasis.

@onready var scroll_container: ScrollContainer = %ScrollContainer
@onready var log_label: RichTextLabel = %LogLabel

var log_entries: PackedStringArray = PackedStringArray()


func _ready() -> void:
	_connect_signals()
	add_log_entry("Game started.")


func _connect_signals() -> void:
	"""Connect to GameEvents signals for automatic log updates."""
	GameEvents.turn_completed.connect(_on_turn_completed)
	GameEvents.production_occurred.connect(_on_production_occurred)
	GameEvents.delivery_made.connect(_on_delivery_made)
	GameEvents.log_entry_added.connect(_on_log_entry_added)
	GameEvents.game_loaded.connect(_on_game_loaded)


func add_log_entry(text: String) -> void:
	"""Add a new entry to the log and auto-scroll to show it."""
	log_entries.append(text)
	log_label.append_text("\n" + text)

	# Auto-scroll to bottom after the next frame when content has updated
	await get_tree().process_frame
	scroll_container.scroll_vertical = int(scroll_container.get_v_scroll_bar().max_value)


func _on_turn_completed(turn_number: int) -> void:
	"""Log turn completion with bold formatting."""
	add_log_entry("[b]--- Turn %d Complete ---[/b]" % turn_number)


func _on_production_occurred(factory_name: String, item_name: String, quantity: int) -> void:
	"""Log production events with green color."""
	add_log_entry("[color=green]Production:[/color] %s produced %d x %s" % [factory_name, quantity, item_name])


func _on_delivery_made(item_name: String, quantity: int, destination: String) -> void:
	"""Log delivery events with cyan color."""
	add_log_entry("[color=cyan]Delivery:[/color] %d x %s delivered to %s" % [quantity, item_name, destination])


func _on_log_entry_added(text: String) -> void:
	"""Handle generic log entry events."""
	add_log_entry(text)


func _on_game_loaded() -> void:
	"""Clear and reload log entries when a game is loaded."""
	clear_log()

	# Reload entries from SaveManager if available
	if SaveManager.current_save and SaveManager.current_save.has("event_log_entries"):
		var saved_entries = SaveManager.current_save.event_log_entries
		for entry in saved_entries:
			log_entries.append(entry)
			log_label.append_text("\n" + entry)
	else:
		add_log_entry("Game loaded.")


func get_entries() -> PackedStringArray:
	"""Return the current log entries for save persistence."""
	return log_entries


func clear_log() -> void:
	"""Clear all log entries and the display."""
	log_entries.clear()
	log_label.clear()
