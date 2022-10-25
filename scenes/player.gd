extends KinematicBody2D

var Bullet = preload("res://scenes//Bullet.tscn")

var velocity = Vector2.ZERO
const speed = 500


func _ready():
	add_to_group("player")


func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	velocity = velocity.normalized()
	
	move_and_collide(velocity  *speed * delta)
	
	var lookvector = get_global_mouse_position() - global_position
	global_rotation = atan2(lookvector.x, -lookvector.y)

func shoot():
	var b = Bullet.instance()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func hit():
	get_tree().reload_current_scene()
