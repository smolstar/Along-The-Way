extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var timer: Timer = $Timer

const SPEED = 160.0
const JUMP_VELOCITY = -300.0

var farmer_in_range = false
var Farmer_in_range = false
var dog_in_range = false
var bowl_in_range = false
var girl_in_range = false
var hearts_list : Array[TextureRect]
var alive : bool = true

const FILE_BEGIN = "res://SCENES/level_"

func _ready():
	add_to_group('Player')
	var hearts_parent = $health_bar/Hbox
	for child in hearts_parent.get_children():
		hearts_list.append(child)
	print(hearts_list)

func reset_items_and_score():
	GameManager.score = 0
	GameManager.apples = 0
	GameManager.bananas = 0
	GameManager.cardboards = 0
	GameManager.grapes = 0
	GameManager.milk = 0
	GameManager.papers = 0
	GameManager.pears = 0
	GameManager.plastics = 0

func take_damage():
	
	if GameManager.currentHealth > 0:
		GameManager.currentHealth -= 1
		update_heart_display()  # Update heart display when taking damage
		reset_items_and_score()  # Reset items and score when taking damage
		GameManager.update_gui()  # Ensure GUI is updated with new state
	
		
	if GameManager.currentHealth <= 0:
		alive = false
		if get_tree() != null:
			get_tree().change_scene_to_file("res://textbox/gameover.tscn")
		else:
			print("Error: get_tree() is null!")
	
		
func update_heart_display():
	for i in range(hearts_list.size()):
		hearts_list[i].visible = i < GameManager.currentHealth
		
	if GameManager.currentHealth <= 0:
		alive = false
		timer.start()
		
func _unhandled_input(event):
	if farmer_in_range  == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://main.dialogue"), "main")
			return
	
	if Farmer_in_range  == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://farmerEnd.dialogue"), "Farmer")
			return
			
	if dog_in_range  == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://dog.dialogue"), "Dog")
			return
			
	if bowl_in_range  == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://dialogue.dialogue"), "Bowl")
			return
			
	if girl_in_range  == true:
		if Input.is_action_just_pressed("ui_accept"):
			DialogueManager.show_example_dialogue_balloon(load("res://textbox/girl.dialogue"), "Girl")
			return
			
	
func _physics_process(delta: float) -> void:
		
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0: 
		animated_sprite.flip_h = false
	elif direction < 0: 
		animated_sprite.flip_h = true  
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("walk")
	else:
		animated_sprite.play("jump")
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
	

			
			
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("farmer"):
		farmer_in_range = true
	if body.has_method("Farmer"):
		Farmer_in_range = true
	if body.has_method("Dog"):
		dog_in_range = true
	if body.has_method("Bowl"):
		bowl_in_range = true
	if body.has_method("Girl"):
		girl_in_range = true



func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("farmer"):
		farmer_in_range = false
	if body.has_method("Farmer"):
		Farmer_in_range = false
	if body.has_method("Dog"):
		dog_in_range = false
	if body.has_method("Bowl"):
		bowl_in_range = false
	if body.has_method("Girl"):
		girl_in_range = false


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().change_scene_to_file("res://textbox/gameover.tscn")
