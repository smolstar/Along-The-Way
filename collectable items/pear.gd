extends AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process (_delta: float) -> void:
	pass

func _on_area_2d_body_entered (body: Node2D) -> void:
	if body.is_in_group('Player'):
		# Increment grape count and score
		GameManager.pears += 1
		GameManager.score += 100  # Increase score by 100 for collecting grapes
		GameManager.update_gui()   # Ensure GUI is updated with new score
		queue_free()  # Remove
