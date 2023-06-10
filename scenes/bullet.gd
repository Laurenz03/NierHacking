extends Area2D

var speed = 750

func _physics_process(delta):
	position += -transform.y * speed * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		return
	if body.is_in_group("enemy"):
		body.hit()
	queue_free()
