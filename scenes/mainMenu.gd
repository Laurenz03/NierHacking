extends Node2D

func _ready():
	$AnimationPlayer.play("Menu")



func _on_Button_pressed():
	#get_tree().change_scene("res://scenes/LoadingScreen.tscn")
	get_tree().change_scene("res://scenes/levels/Level1.tscn")
