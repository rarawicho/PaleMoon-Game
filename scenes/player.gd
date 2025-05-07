extends CharacterBody2D

@export var SPEED: float
@onready var animated_sprite = $AnimatedSprite2D
var is_fascing_right = true

func _physics_process(delta):
	move_x()
	flip()
	update_animations()
	move_and_slide()

	#si esta mirando a la derecha y aprieto a la izquierda 
	#si esta mirando a la izquierda y aprieto a la derecha
	
func update_animations():
	if velocity.x:
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
		
func flip():
	if (is_fascing_right and velocity.x < 0) or (not is_fascing_right and velocity.x > 0):
		$AnimatedSprite2D.scale.x *= -1
		is_fascing_right = not is_fascing_right
		
	move_and_slide()
	
func move_x():
		var input_axis = Input.get_axis("move_left", "move_right")
		velocity.x = input_axis * SPEED
	
