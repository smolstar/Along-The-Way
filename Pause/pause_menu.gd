extends Control

@onready var setting_button = $PanelContainer/VBoxContainer/Setting as Button
@onready var panel_container = $PanelContainer as PanelContainer
@onready var setting_menu = $Setting_Menu as Setting_Menu

signal exit_setting_menu  # Ensure the signal name is consistent

func _ready():
	$AnimationPlayer.play("RESET")
	handle_connecting_signals()

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("blur")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("blur")

func testEsc():
	if Input.is_action_just_pressed("ui_select") and !get_tree().paused:
		pause()
	

func _on_resume_pressed():
	resume()

func _on_restart_pressed():
	resume()
	get_tree().reload_current_scene()

func _on_exit_pressed():
	get_tree().quit()

func _process(delta):
	testEsc()
	
func on_exit_setting_menu() -> void:
	panel_container.visible = true
	setting_menu.visible = false


func _on_setting_pressed() -> void:
	panel_container.visible = false
	setting_menu.set_process(true)
	setting_menu.visible = true

func handle_connecting_signals() -> void:
	if setting_button:
		setting_button.button_down.connect(_on_setting_pressed)
	else:
		print("Setting Button is null")
		
	if setting_menu:
		setting_menu.exit_setting_menu.connect(on_exit_setting_menu)
	else:
		print("Setting Menu is null")
