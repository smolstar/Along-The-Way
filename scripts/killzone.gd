extends Area2D

@onready var timer: Timer = $Timer
@onready var audio_stream_player_2d = $AudioStreamPlayer2D as AudioStreamPlayer2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		print("Player took damage!")
		audio_stream_player_2d.play()
		body.take_damage()  # Call the take_damage method from the Player script
		Engine.time_scale = 0.5 
		timer.start()
		GameManager.score = 0
		GameManager.plastics = 0
		GameManager.update_gui()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
