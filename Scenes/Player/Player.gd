extends KinematicBody2D

var Bullet = preload("res://Scenes/Bullet/Bullet.tscn")
var extents
var velocity = Vector2()
export (int) var speed = 250

func _ready():
	extents = $CollisionShape2D.shape.get_extents()

func shoot():
	var b = Bullet.instance()
	get_parent().add_child(b)
	b.transform = $Muzzle.global_transform

func dodge():
	$CollisionShape2D.shape.set_extents(Vector2(extents.x, extents.y/2))
	
	
func un_dodge():
	$CollisionShape2D.shape.set_extents(extents)

func get_input():
	velocity = Vector2()
	look_at(get_global_mouse_position())
	
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
		
	if Input.is_action_just_pressed("dodge"):
		dodge()
	if Input.is_action_just_released("dodge"):
		un_dodge()

func _physics_process(delta):
	get_input()
	move_and_collide(velocity *  delta)
	
