extends Node
## Save/load manager with atomic write protection.
##
## This autoload singleton handles all save and load operations using JSON
## serialization. Implements atomic write pattern (save to temp, backup existing, rename)
## to prevent save file corruption from crashes or power loss.

const SAVE_PATH := "user://savegame.json"
const TEMP_PATH := "user://savegame.tmp"
const BACKUP_PATH := "user://savegame.bak"
const AUTOSAVE_INTERVAL := 10

var current_save: Dictionary = {}
var turns_since_autosave: int = 0
var pending_event_log_entries: Array[String] = []


func _ready() -> void:
	GameEvents.turn_completed.connect(_on_turn_completed)


func save_game() -> bool:
	"""Save current game state with atomic write protection."""
	# Collect event log entries from listeners
	pending_event_log_entries.clear()
	GameEvents.save_requested.emit()

	# Warn if no event log entries were collected (EventLog may not be in scene tree)
	if pending_event_log_entries.is_empty():
		push_warning("SaveManager: No event log entries collected during save. EventLog node may not be in scene tree.")

	# Populate save data from game state
	current_save = {
		"save_version": 1,
		"timestamp": Time.get_unix_time_from_system(),
		"current_turn": GameState.current_turn,
		"game_time": GameState.game_time.duplicate(),
		"event_log_entries": pending_event_log_entries.duplicate()
	}

	# Convert to JSON
	var json_string := JSON.stringify(current_save, "\t")

	# Save to temporary file first (atomic write pattern)
	var file := FileAccess.open(TEMP_PATH, FileAccess.WRITE)
	if file == null:
		var error := FileAccess.get_open_error()
		push_error("Failed to open temp file for writing: " + str(error))
		return false

	file.store_string(json_string)
	file.close()

	# Backup existing save if it exists
	if FileAccess.file_exists(SAVE_PATH):
		var backup_error := DirAccess.rename_absolute(SAVE_PATH, BACKUP_PATH)
		if backup_error != OK:
			push_error("Failed to backup existing save: " + str(backup_error))
			# Continue anyway - temp file is safe

	# Move temp to actual save path
	var rename_error := DirAccess.rename_absolute(TEMP_PATH, SAVE_PATH)
	if rename_error != OK:
		push_error("Failed to rename temp save to final path: " + str(rename_error))
		return false

	# Success
	GameEvents.game_saved.emit()
	GameEvents.notification_requested.emit("Game saved", "success")
	return true


func load_game() -> bool:
	"""Load game state from save file."""
	if not FileAccess.file_exists(SAVE_PATH):
		push_warning("No save file found at: " + SAVE_PATH)
		return false

	# Load JSON file
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		var error := FileAccess.get_open_error()
		push_error("Failed to open save file: " + str(error))
		return false

	var json_string := file.get_as_text()
	file.close()

	# Parse JSON
	var json := JSON.new()
	var parse_error := json.parse(json_string)
	if parse_error != OK:
		push_error("Failed to parse save file JSON at line " + str(json.get_error_line()) + ": " + json.get_error_message())
		return false

	current_save = json.data

	# Restore game state
	GameState.current_turn = current_save.get("current_turn", 0)
	GameState.game_time = current_save.get("game_time", {"day": 0, "month": 1, "year": 1}).duplicate()

	# Emit signals
	GameEvents.game_loaded.emit()
	var turn_text := "Turn " + str(current_save.get("current_turn", 0))
	GameEvents.notification_requested.emit("Game loaded - " + turn_text, "info")
	return true


func has_save() -> bool:
	"""Check if a save file exists."""
	return FileAccess.file_exists(SAVE_PATH)


func new_game() -> void:
	"""Start a new game by resetting all state."""
	GameState.reset()
	current_save = {}
	turns_since_autosave = 0
	GameEvents.game_loaded.emit()


func get_save_info() -> Dictionary:
	"""Get save file info without full load (for UI display)."""
	if not has_save():
		return {}

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return {}

	var json_string := file.get_as_text()
	file.close()

	var json := JSON.new()
	if json.parse(json_string) != OK:
		return {}

	var data: Dictionary = json.data
	return {
		"timestamp": data.get("timestamp", 0),
		"turn": data.get("current_turn", 0)
	}


func _on_turn_completed(turn_number: int) -> void:
	"""Handle autosave logic."""
	turns_since_autosave += 1
	if turns_since_autosave >= AUTOSAVE_INTERVAL:
		save_game()
		turns_since_autosave = 0
		GameEvents.notification_requested.emit("Autosaved", "info")
