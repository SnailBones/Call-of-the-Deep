extends CharacterBody2D
class_name Monster

const rythm1 = [1, 1, 1]
const tune1 = [0, 7, -12]

const rythm2 = [1, .5, .5, 1]
const tune2 = [0, 3, 7, -12]

const rythm3 = [1, .5, .5, 1, .5, .5]
const tune3 = [0, 3, 7, -12, 12, -24]

const BPM = 120
const TRANSPOSE = 0
const MONSTER_PATIENCE = 3 # How long a monster waits for a response before getting angry

var waiting = false;
var currentTime = -1
#var singing = false
@onready var singer = $Singer

var rythm
var tune

func getTune(num: int):
	if num == 1:
		return tune1.duplicate()
	if num == 2:
		return tune2.duplicate()
	if num == 3:
		return tune3.duplicate()
	printerr("invalid index", num)
	
func getRythm(num: int):
	if num == 1:
		return rythm1.duplicate()
	if num == 2:
		return rythm2.duplicate()
	if num == 3:
		return rythm3.duplicate()
	printerr("invalid index", num)

func _physics_process(delta: float) -> void:
	if (currentTime != -1): # if not paused
		currentTime -= delta
		if (currentTime > 0):
			return
		elif !rythm.is_empty(): # play the next song in the note
			var note = tune.pop_front()+TRANSPOSE
			var noteLength = rythm.pop_front()
			currentTime += (noteLength / (BPM / 60.0));
			singer.sing(note)
		elif !waiting: # done song. Now we wait.
			waiting = true
			currentTime += MONSTER_PATIENCE;
		else:
			# TODO: angry roar
			waiting = false
			currentTime = -1 # reset cycle

func isResting():
	return currentTime == -1
	
func rest():
	if rythm.is_empty():
		currentTime = -1

func awaken(t, r):
	currentTime = 0
	tune = t.duplicate()
	rythm = r.duplicate()
