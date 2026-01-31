extends CanvasLayer
## Notification manager that spawns toast notification instances.
##
## This manager listens to GameEvents.notification_requested and creates
## toast notification instances that display, animate, and self-destruct.

const TOAST_SCENE = preload("res://scenes/ui/toast_notification.tscn")

@onready var toast_container: VBoxContainer = $ToastContainer


func _ready() -> void:
	_connect_signals()


func _connect_signals() -> void:
	"""Connect to GameEvents for notification requests."""
	GameEvents.notification_requested.connect(_on_notification_requested)


func _on_notification_requested(message: String, type: String) -> void:
	"""Create and display a new toast notification."""
	var toast = TOAST_SCENE.instantiate()
	toast_container.add_child(toast)
	toast.display(message, type)
