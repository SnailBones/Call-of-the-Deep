extends CharacterBody2D

const RANGE = 500
var total_distance = 0;

func _physics_process(delta: float) -> void:

	#var direction = Vector2.UP.rotated(rotation)
	#var distance = linear_velocity.length() * delta
	#position += direction * distance
	#var collision_info = move_and_collide(direction*distance)
	var collision = move_and_collide(velocity*delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		#rotation = velocity.angle()
	#total_distance += distance
	rotation = velocity.angle()
	if total_distance > RANGE:
		queue_free()

#
#func _on_body_entered(body):
	#queue_free();

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
