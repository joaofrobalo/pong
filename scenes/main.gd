extends Node2D

var score_p1 = 0
var score_p2 = 0
var ball_scene = preload("res://scenes/ball_3.tscn")
@onready var player_1_score = $Player1Score
@onready var player_2_score = $Player2Score


func ball_spawn():
	var b = ball_scene.instantiate()
	add_child(b)


func _on_left_goal_body_entered(body):
	if body.is_in_group("ball"):
		score_p2 += 1
		#print("Player 2 has: ", score_p2)
		player_2_score.text = str(score_p2)
		body.queue_free()
		ball_spawn()
	
func _on_right_goal_body_entered(body):
	if body.is_in_group("ball"):
		score_p1 += 1
		player_1_score.text = str(score_p1)
		body.queue_free()
		ball_spawn()
