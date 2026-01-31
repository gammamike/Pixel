class_name SaveGame
extends Resource
## Serializable game state resource for save/load operations.
##
## This resource class defines the complete saveable game state structure.
## All @export variables will be automatically serialized by ResourceSaver.
## Future phases will add additional data fields (factories, resources, convoys, research).

@export var save_version: int = 1
@export var timestamp: int = 0
@export var current_turn: int = 0
@export var game_time: Dictionary = {}
@export var event_log_entries: Array[String] = []

# Phase 2+: factories, resources, convoys, research
# @export var factories: Array[Dictionary] = []
# @export var resources: Dictionary = {}
# @export var convoys: Array[Dictionary] = []
# @export var research_progress: Dictionary = {}
