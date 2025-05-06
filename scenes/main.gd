extends Node2D

var score = 0
var enemies_killed = 0
@onready var score_label = $UI/ScoreLabel

func enemy_destroyed():
	enemies_killed += 1
	score += 100
	score_label.text = "Puntos: %d" % score

	if enemies_killed >= 20:
		game_complete()

func game_complete():
	get_tree().paused = true
	score_label.text += "  ¡Nivel completo!"
