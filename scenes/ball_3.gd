extends CharacterBody2D

var speed = 400.0

func _ready():
	velocity.x = [-1, 1].pick_random()
	velocity.y = [-1, 1].pick_random()

func _physics_process(delta):
	
	# move the body based on given velocity, times speed and normalized by frames
	# move_and_collide returns a collision object with lots of info about the collision and the object we collided with
	var collision = move_and_collide(velocity * speed * delta)
	
	# if we collided, then bounce the body using the "normal" of the collsion
	# the normal is the angle in which our body hit the other collider
	if collision:
		velocity = velocity.bounce(collision.get_normal())

