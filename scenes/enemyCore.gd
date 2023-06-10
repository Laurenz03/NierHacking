extends KinematicBody2D
export (NodePath) var playerNodePath

var Bullet = preload("res://scenes//EnemyBullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = Vector2.ZERO
var speed = 10
var lives = 10
var shielded = true


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemy")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	velocity = get_node(playerNodePath).get_position() - global_position
	global_rotation = atan2(velocity.x, -velocity.y)  #velocity is the normalized player position
	velocity = velocity.normalized()
	move_and_collide(velocity *speed *delta)
	if get_tree().get_nodes_in_group("enemy").size() == 1:
		$Sprite2.set_visible(false)
		shielded = false

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func hit():
	if shielded == false:
		lives -= 1
	if lives == 0:
		queue_free()
		print_debug("you win")


func _on_Timer_timeout():
	shoot()
