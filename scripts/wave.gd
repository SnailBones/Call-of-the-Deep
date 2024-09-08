extends Area2D

var total_distance = 0;

func _physics_process(delta: float) -> void:
	const speed = 100
	const range = 500
	var direction = Vector2.UP.rotated(rotation)
	var distance = speed * delta
	position += direction * distance
	total_distance += distance
	if total_distance > range:
		queue_free()
#
#func _on_body_entered(body):
	#queue_free();

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free();
