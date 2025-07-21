extends Node3D

var score: int = 0
@onready var score_label = $CanvasLayer/ScoreLabel
@onready var death_menu = $CanvasLayer/DeathMenu
@onready var health = $CanvasLayer/Health

#func _ready():
	#print(death_menu.pause_mode)

func _physics_process(delta):
	if (health.value <= 0):
		show_death_menu()

func add_score(n):
	score += n
	score_label.text = "Enemies killed: " + str(score)

func get_score():
	return score


func show_death_menu():
	death_menu.visible = true


func _on_button_pressed():
	print("jhkj")
	_on_restart_button_pressed()

func _on_restart_button_pressed():
	print("pressed")
	get_tree().paused = false
	get_tree().reload_current_scene()

func player_take_damage(n):
	health.value -= n

func get_player_health():
	return health.value
