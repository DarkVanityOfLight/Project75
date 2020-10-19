extends KinematicBody2D

const speed = 400

func _ready():
	pass

func _physics_process(delta):
	var collision = move_and_collide(transform.x * speed * delta)
	
	if collision:
		queue_free()
	

