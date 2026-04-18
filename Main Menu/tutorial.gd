extends Control

func testEsc():
	if Input.is_action_just_pressed("ui_select"):
		get_tree().change_scene_to_file("res://SCENES/level_1.tscn")

func _process(delta):
	testEsc()
