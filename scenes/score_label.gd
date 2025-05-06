extends Label
@onready var score_label = $CanvasLayer/ScoreLabel

var score = 0

func enemy_destroyed():
	score += 100
	score_label.text = "Puntos: %d" % score
