extends AnimatedSprite2D

const FILE_BEGIN = "res://SCENES/level_"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group('Player'):
		print("collided with player")
		get_tree().change_scene_to_file("res://SCENES/level_4.tscn")
