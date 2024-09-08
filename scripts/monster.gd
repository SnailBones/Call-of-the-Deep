extends CharacterBody2D

var rythm1 = [1, 1, 1]
var tune1 = [0, 7, -12]

var rythm2 = [1, .5, .5, 1]
var tune2 = [0, 3, 7, -12]
const BPM = 120
const DELAY_START = 1
var currentTime = DELAY_START
@onready var singer = $Singer
const TRANSPOSE = 0

var rythm = rythm2
var tune = tune2

func _physics_process(delta: float) -> void:
	currentTime -= delta
	if (currentTime > 0):
		return
	elif !rythm.is_empty():
		var note = tune.pop_front()+TRANSPOSE
		var noteLength = rythm.pop_front()
		currentTime += (noteLength / (BPM / 60.0));
		singer.sing(note)
