extends Node

var apples = 0
var plastics = 0
var bananas = 0
var cardboards = 0
var pears = 0
var grapes = 0
var milk = 0
var papers = 0
var score = 0
var currentHealth : int = 3

var score_met = false  # Added track for score condition

func _process(delta):
	update_gui()

func update_gui():
	var apples_value = get_node("GUI/ApplesValue")
	if apples_value:
		apples_value.text = str(apples)
	
	var bananas_value = get_node("GUI/BananasValue")
	if bananas_value:
		bananas_value.text = str(bananas)
	
	var cardboards_value = get_node("GUI/CardboardsValue")
	if cardboards_value:
		cardboards_value.text = str(cardboards)
	
	var pears_value = get_node("GUI/PearsValue")
	if pears_value:
		pears_value.text = str(pears)
	
	var grapes_value = get_node("GUI/GrapesValue")
	if grapes_value:
		grapes_value.text = str(grapes)
	
	var milk_value = get_node("GUI/MilkValue")
	if milk_value:
		milk_value.text = str(milk)
	
	var papers_value = get_node("GUI/PaperValue")
	if papers_value:
		papers_value.text = str(papers)
	
	var plastics_value = get_node("GUI/PlasticsValue")
	if plastics_value:
		plastics_value.text = str(plastics)
	
	var score_value = get_node("GUI/ScoreValue")
	if score_value:
		score_value.text = str(score)
	
	var hearts_value = get_node("$health_bar")
	if hearts_value:
		hearts_value.text = str(currentHealth)
	
