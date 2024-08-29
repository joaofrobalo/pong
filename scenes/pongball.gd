extends Area2D

var direction : Vector2 = Vector2.ZERO
var speed : int = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	direction = Vector2(-1, 0)

func _physics_process(delta):
	global_position += direction * speed * delta

func _on_body_entered(body):
	if body.side == "left":
		direction = Vector2(1, 0)
	elif body.side == "right":
		direction = Vector2(-1, 0)
