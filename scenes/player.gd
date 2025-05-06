extends CharacterBody2D

const SPEED = 200
const BULLET_SCENE = preload("res://scenes/Bullet.tscn")

@onready var muzzle = $Muzzle
var shoot_direction = Vector2.RIGHT

func _process(delta):
	var dir = Vector2.ZERO

	dir.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	dir.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	velocity = dir.normalized() * SPEED
	move_and_slide()

	if Input.is_action_pressed("shoot_up"):
		shoot_direction = Vector2.UP
		shoot()
	elif Input.is_action_pressed("shoot_down"):
		shoot_direction = Vector2.DOWN
		shoot()
	elif Input.is_action_pressed("shoot_left"):
		shoot_direction = Vector2.LEFT
		shoot()
	elif Input.is_action_pressed("shoot_right"):
		shoot_direction = Vector2.RIGHT
		shoot()

func shoot():
	var bullet = BULLET_SCENE.instantiate()
	bullet.position = muzzle.global_position
	bullet.direction = shoot_direction
	get_parent().add_child(bullet)
