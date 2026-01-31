extends PanelContainer
## Individual toast notification that displays, animates, and self-destructs.
##
## Toast notifications provide brief visual feedback for important actions.
## They fade in, stay visible for a duration, then fade out and destroy themselves.

@onready var label: Label = %Label
@onready var timer: Timer = %Timer


func display(message: String, type: String) -> void:
	"""Display the toast with color based on type and animate in/out."""
	label.text = message

	# Apply color based on notification type
	var base_color: Color
	match type:
		"info":
			base_color = Color(0.3, 0.4, 0.7, 0.95)
		"success":
			base_color = Color(0.2, 0.6, 0.3, 0.95)
		"warning":
			base_color = Color(0.7, 0.6, 0.2, 0.95)
		"error":
			base_color = Color(0.7, 0.2, 0.2, 0.95)
		_:
			base_color = Color(0.3, 0.4, 0.7, 0.95)  # Default to info

	# Start invisible for fade-in animation
	modulate = Color(base_color.r, base_color.g, base_color.b, 0.0)

	# Fade in
	var tween_in := create_tween()
	tween_in.tween_property(self, "modulate:a", 0.95, 0.2)
	await tween_in.finished

	# Wait for timer
	timer.start()
	await timer.timeout

	# Fade out
	var tween_out := create_tween()
	tween_out.tween_property(self, "modulate:a", 0.0, 0.3)
	await tween_out.finished

	# Clean up
	queue_free()
