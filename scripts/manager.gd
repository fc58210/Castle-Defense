class_name Manager

extends Node

var points = 0
@onready var score: Label = $Poins

func pointss():
	points += 1
	score.text = "You collected " + str(points) + " coins. Press Enter to enter de Next Level"
