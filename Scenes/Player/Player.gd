extends KinematicBody2D

var Bullet = preload("res://Scenes/Bullet/Bullet.tscn")

var velocity = Vector2()
var speed = 250

func _ready():
	pass

func shoot():
	var b = Bullet.instance()
	get_parent().add_child(b)
	b.transform = $Muzzle.global_transform

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed("walk_up"):
		velocity.y -= 1
	if Input.is_action_pressed("walk_down"):
		velocity.y += 1
	if Input.is_action_pressed("walk_left"):
		velocity.x -= 1
	if Input.is_action_pressed("walk_right"):
		velocity.x += 1
			
	velocity = velocity.normalized() * speed
		
	if Input.is_action_just_pressed("shoot"):
		shoot()

func _physics_process(delta):
	get_input()
	move_and_collide(velocity *  delta)
	look_at(get_local_mouse_position())
	
