extends RigidBody2D

var direction = Vector2(-1, 0)
var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	bump(direction, speed)
	contact_monitor = true
	max_contacts_reported = 10

func _physics_process(delta):
	apply_central_force(direction * speed)

func _on_body_entered(body):
	print("I hit " + body.name)
	if body.name == "Paddle":
		direction = Vector2(1,0)
		bump(direction, speed)
	elif body.name == "Paddle2":
		direction = Vector2(-1,0)
		bump(direction, speed)
		
func bump(bump_direction, ball_speed):
	# takes a direction and speed and applies an impulse on the rigidbody
	#apply_central_impulse(bump_direction * ball_speed)
	direction = bump_direction
	speed = ball_speed
	
