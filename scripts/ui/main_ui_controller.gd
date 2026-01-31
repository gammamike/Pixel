extends Control
## Main UI controller handling menu bar, tab navigation, and turn display.
##
## This script manages the root UI for the game, including the File menu,
## turn counter display, and End Turn button functionality.

@onready var file_menu_button: MenuButton = %FileMenuButton
@onready var turn_label: Label = %TurnLabel
@onready var end_turn_button: Button = %EndTurnButton
@onready var tab_container: TabContainer = %TabContainer


func _ready() -> void:
	_setup_file_menu()
	_connect_signals()
	_update_turn_label()


func _setup_file_menu() -> void:
	"""Set up the File menu with Save, Load, New Game, and Quit options."""
	var popup: PopupMenu = file_menu_button.get_popup()
	popup.clear()

	# Add menu items
	popup.add_item("New Game", 0)
	popup.add_separator()
	popup.add_item("Save", 1)
	popup.add_item("Load", 2)
	popup.add_separator()
	popup.add_item("Quit", 3)

	# Connect the popup menu signal
	popup.id_pressed.connect(_on_file_menu_item_selected)


func _connect_signals() -> void:
	"""Connect all UI signals."""
	end_turn_button.pressed.connect(_on_end_turn_pressed)
	GameState.turn_advanced.connect(_on_turn_advanced)
	GameEvents.game_loaded.connect(_on_game_loaded)


func _on_file_menu_item_selected(id: int) -> void:
	"""Handle File menu item selection."""
	match id:
		0:  # New Game
			GameState.reset()
			GameEvents.game_loaded.emit()
			_update_turn_label()
		1:  # Save
			SaveManager.save_game()
		2:  # Load
			SaveManager.load_game()
		3:  # Quit
			get_tree().quit()


func _on_end_turn_pressed() -> void:
	"""Handle End Turn button press."""
	GameState.advance_turn()


func _on_turn_advanced(turn_number: int) -> void:
	"""Handle turn advancement signal."""
	_update_turn_label()


func _on_game_loaded() -> void:
	"""Handle game loaded signal."""
	_update_turn_label()


func _update_turn_label() -> void:
	"""Update the turn label with current game time."""
	turn_label.text = GameState.get_time_display()
