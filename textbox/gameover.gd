extends CanvasLayer


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu/main_menu.tscn")
	GameManager.currentHealth = 3


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_timer_timeout() -> void:
	pass # Replace with function body.
