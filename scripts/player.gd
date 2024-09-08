extends CharacterBody2D
class_name Player
@onready var singer: Singer = $Singer
var rand = RandomNumberGenerator.new()
@export var missColor: Color = Color.CRIMSON

signal sing_signal

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("sing"):
		sing_signal.emit()

func hitNote(note: float) -> void:
	singer.sing(note); 

func missNote(note: float) -> void:
	singer.sing(note+rand.randf_range(-1.0, 1.0), missColor); 
	
func singTuneless() -> void:
	var note = rand.randi_range (-12, 12);
	var color = Color.from_hsv((note+12)/24.0 , 1, 1, .1)
	singer.sing(note, color);  
