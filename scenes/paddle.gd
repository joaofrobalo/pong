extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var side : String
var direction

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	
	if side == "left":
		direction = Input.get_axis("up_W", "down_S")
	elif side == "right":
		direction = Input.get_axis("up_arrow", "down_arrow")
	
	if direction:
		velocity.y = direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()

