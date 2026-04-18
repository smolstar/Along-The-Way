class_name Setting_Menu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/exit_button as Button
 

signal exit_setting_menu  # Ensure the signal name is consistent

func _ready():  # Corrected function name, it should be _ready() not func_ready()
	exit_button.button_down.connect(_on_exit_button_pressed)  # Connect signal correctly
	set_process(false)
	

func _on_exit_button_pressed() -> void:
	emit_signal("exit_setting_menu")  # Emit the correct signal
	set_process(false)  # This is fine, as per your intention
