extends Node

var points = 0
var gameStatus = "running"
@onready var label = %Label


func add_point():
	points += 1
	label.text = "Points: " + str(points)

func change_game_completion_status(status):
	gameStatus = status
	print(gameStatus)


