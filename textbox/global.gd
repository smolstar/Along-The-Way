extends Node

# Track if the player has met the farmer
var farmer_met = false
# Function to change scenes
func go_to_scene(scene_path: String):
	get_tree().change_scene_to_file("res://textbox/Finished.tscn")

# You can also have other global functionality here...
