extends Node2D
class_name MonsterManager

const monster1 = preload("res://characters/monsters/squid_monster.tscn")
const monster2 = preload("res://characters/monsters/worm_monster.tscn")
const monster3 = preload("res://characters/monsters/maw_monster.tscn")

var waiting = false;
var currentTime = -1
var monsterNum = 1
#var singing = false
var singer
var angryNoise: AudioStreamPlayer2D


var monster = null
var rythm
var tune

func switchMonster(n: int):
	if monster: monster.queue_free()
	if n == 1:
		monster = monster1.instantiate()
	elif n == 2:
		monster = monster2.instantiate()
	else:
		monster = monster3.instantiate()
	add_child(monster)
	singer = monster.get_node("Singer")
	angryNoise = monster.get_node("AngryNoise")

func _ready() -> void:
	switchMonster(1)

func _physics_process(delta: float) -> void:
	if (currentTime != -1): # if not paused
		currentTime -= delta
		if (currentTime > 0):
			return
		elif !rythm.is_empty(): # play the next song in the note
			var note = tune.pop_front()+monster.transpose
			var noteLength = rythm.pop_front()
			currentTime += (noteLength * 4.0/ (monster.bpm / 60.0));
			singer.sing(note)
		elif !waiting: # done song. Now we wait.
			waiting = true
			currentTime += monster.patience;
		else:
			# TODO: angry roar
			waiting = false
			currentTime = -1 # reset cycle

func isResting():
	return currentTime == -1
	
func rest():
	if rythm.is_empty():
		currentTime = -1

func awaken(t, r, n):
	currentTime = 0
	if (n != monsterNum):
		monsterNum = n
		switchMonster(n)
	tune = t.duplicate()
	rythm = r.duplicate()

func playAngryNoise():
	angryNoise.play()
	
func getTune(n):
	return monster.getTune(n)
	
func getRythm(n):
	return monster.getRythm(n)
	
