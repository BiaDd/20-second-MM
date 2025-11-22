extends Node2D

@onready var timer_label = $TimerLabel
var time_left = 20.0

func _process(delta):
	time_left -= delta
	if time_left < 0:
		time_left = 0
		game_over(false)
	timer_label.text = str(int(time_left))

func game_over(win: bool):
	if win:
		print("You solved it!")
	else:
		print("Time's up! Game Over.")
