extends Node

func _ready():
	print_debug(get_tree().get_current_scene().get_name())

func _process(delta):
	if get_tree().get_nodes_in_group("enemy").size() == 0:
		if get_tree().get_current_scene().get_name() == "Level1":
			get_tree().change_scene("res://scenes/levels/Level2.tscn")
		elif get_tree().get_current_scene().get_name() == "Level2":
			get_tree().change_scene("res://scenes/levels/Level3.tscn")
		elif get_tree().get_current_scene().get_name() == "Level3":
			get_tree().change_scene("res://scenes/levels/Congrats.tscn")
		#get_tree().change_scene("res://scenes/LoadingScreen.tscn")
