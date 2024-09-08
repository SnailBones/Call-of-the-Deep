extends CharacterBody2D

@onready var singer = $Singer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("sing"):
		singer.sing()
		
		
