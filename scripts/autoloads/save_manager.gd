extends Node
## Save/load manager with atomic write protection.
##
## This autoload singleton handles all save and load operations using Godot's Resource-based
## serialization system. Implements atomic write pattern (save to temp, backup existing, rename)
## to prevent save file corruption from crashes or power loss.

const SAVE_PATH := "user://savegame.tres"
const TEMP_PATH := "user://savegame.tmp"
const BACKUP_PATH := "user://savegame.bak"
const AUTOSAVE_INTERVAL := 10

var current_save: SaveGame = null
var turns_since_autosave: int = 0


func _ready() -> void:
	GameEvents.turn_completed.connect(_on_turn_completed)


func save_game() -> bool:
	"""Save current game state with atomic write protection."""
	if current_save == null:
		current_save = SaveGame.new()

	# Populate save data from game state
	current_save.timestamp = Time.get_unix_time_from_system()
	current_save.current_turn = GameState.current_turn
	current_save.game_time = GameState.game_time.duplicate()

	# Save to temporary file first (atomic write pattern)
	var error := ResourceSaver.save(current_save, TEMP_PATH)
	if error != OK:
		push_error("Failed to save game to temp file: " + str(error))
		return false

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
	if not ResourceLoader.exists(SAVE_PATH):
		push_warning("No save file found at: " + SAVE_PATH)
		return false

	# Load with CACHE_MODE_IGNORE to prevent stale data
	current_save = ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE)
	if current_save == null:
		push_error("Failed to load save file")
		return false

	# Restore game state
	GameState.current_turn = current_save.current_turn
	GameState.game_time = current_save.game_time.duplicate()

	# Emit signals
	GameEvents.game_loaded.emit()
	GameEvents.notification_requested.emit(
		"Game loaded - Turn %d" % current_save.current_turn,
		"info"
	)

	return true


func has_save() -> bool:
	"""Check if a save file exists."""
	return ResourceLoader.exists(SAVE_PATH)


func get_save_info() -> Dictionary:
	"""Get save file metadata without full load."""
	if not has_save():
		return {}

	var save := ResourceLoader.load(SAVE_PATH, "", ResourceLoader.CACHE_MODE_IGNORE) as SaveGame
	if save == null:
		return {}

	return {
		"timestamp": save.timestamp,
		"turn": save.current_turn
	}


func _on_turn_completed(turn_number: int) -> void:
	"""Handle autosave on turn completion."""
	turns_since_autosave += 1
	if turns_since_autosave >= AUTOSAVE_INTERVAL:
		save_game()
		turns_since_autosave = 0
		GameEvents.notification_requested.emit("Autosaved", "info")
