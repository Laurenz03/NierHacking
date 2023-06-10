extends Node2D

onready var currentLevel = 1

func _ready():
	pass

func _process(delta):
	if currentLevel == 1:
		get_tree().change_scene("res://scenes/levels/Level1.tscn")
		currentLevel += 1
	elif currentLevel == 2:
		get_tree().change_scene("res://scenes/levels/Level2.tscn")
		currentLevel += 1
	elif currentLevel == 3:
		get_tree().change_scene("res://scenes/levels/Level3.tscn")
		currentLevel += 1
