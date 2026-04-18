extends Area2D

@onready var timer: Timer = $"../Timer"
@onready var audio_stream_player_2d = $AudioStreamPlayer2D as AudioStreamPlayer2D


func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	audio_stream_player_2d.play()
	Engine.time_scale = 0.5 
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 0.5
	get_tree().reload_current_scene()
	
