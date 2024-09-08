extends CharacterBody2D
var hits = -1

func setColor(color:Color)->void:
	$ColorRect.color = color

func _physics_process(delta: float) -> void:

	var collision = move_and_collide(velocity*delta)
	if collision:
		if hits != -1: # Exclude counting collisions with spawning object by staying in special state until no collisions
			velocity = velocity.bounce(collision.get_normal())
			collision.get_collider_id()
			hits = hits + 1
			if hits > 1:
				queue_free()
	elif hits == -1:
		hits = 0;
	rotation = velocity.angle()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
