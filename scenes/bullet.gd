extends Area2D

export var speed = 500
var direction = Vector2.RIGHT

func _process(delta):
	position += direction.normalized() * speed * delta
	if not get_viewport_rect().has_point(global_position):
		queue_free()

func _on_Bullet_body_entered(body):
	if body.is_in_group("enemies"):
		body.take_damage()
		queue_free()
