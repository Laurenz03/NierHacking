extends Area2D

var speed = 500

func _physics_process(delta):
	position += -transform.y * speed * delta


func _on_Area2D_body_entered(body):
	if body.is_in_group("enemy"):
		return
	if body.is_in_group("player"):
		queue_free()
		body.hit()
	else:
		queue_free()




