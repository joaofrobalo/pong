extends Area2D

var direction : Vector2 = Vector2.ZERO
var speed : int = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	direction.x = [-1, 1].pick_random()
	direction.y = [-1, 1].pick_random()

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body):
	if body is CharacterBody2D:
		if body.side == "left":
			direction.x *= -1
		elif body.side == "right":
			direction = Vector2(-1, 0)
	elif body.name == "top" or body.name == "bottom":
		print("I've hit the bottom or top!")
		direction.y *= -1
