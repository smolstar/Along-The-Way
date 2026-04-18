extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer2/Start as Button
@onready var setting_button = $MarginContainer/HBoxContainer/VBoxContainer2/Setting as Button
@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer2/Exit as Button  # Fixed the path
@onready var setting_menu = $Setting_Menu as Setting_Menu
@onready var margin_container = $MarginContainer as MarginContainer

func _ready():
	handle_connecting_signals()
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Main Menu/tutorial.tscn")

func on_setting_pressed() -> void:
	margin_container.visible = false
	setting_menu.set_process(true)
	setting_menu.visible = true

func on_exit_pressed() -> void:
	get_tree().quit()
	
func on_exit_setting_menu() -> void:
	margin_container.visible = true
	setting_menu.visible = false
	
func handle_connecting_signals() -> void:
	if start_button:
		start_button.button_down.connect(on_start_pressed)
	else:
		print("Start Button is null")

	if setting_button:
		setting_button.button_down.connect(on_setting_pressed)
	else:
		print("Setting Button is null")

	if exit_button:
		exit_button.button_down.connect(on_exit_pressed)
	else:
		print("Exit Button is null")

	if setting_menu:
		setting_menu.exit_setting_menu.connect(on_exit_setting_menu)
	else:
		print("Setting Menu is null")
