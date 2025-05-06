extends CharacterBody2D

var health = 3
var speed = 100
@onready var main = get_tree().get_root().get_node("Main")  # ajusta según estructura real

func _process(delta):
	var player = get_parent().get_node("Player")
	if player:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * speed
		move_and_slide()

func take_damage():
	health -= 1
	if health <= 0:
		main.enemy_destroyed()
		queue_free()
