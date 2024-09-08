extends Node2D

const TIME_BETWEEN_MONSTERS = 1 # Atmospheric break between monsters.
const TIME_BETWEEN_SONGS = 1 # How quickly monster replies after a sucessful or failed song.
const MAX_FAILS = 3 # Monster kills you on third fail
var time = 0
var monsterNumber = 1 # 1st, 2nd, or third monster.
var songNumber = 0 # Monster song number. 0 is between monsters.
var fails = 0


func _physics_process(delta: float) -> void:
	time += delta
	if songNumber == 0: # Atmospheric break between monsters
		if time > TIME_BETWEEN_MONSTERS:
			songNumber = 1
	# For each monster:
		# Load song from monster
		# Monster starts to sing
		# Give player time to respond
		# Start player timer on first note
			# If another note is too wrong, anger monster
			# Also change color and pitch
		# If player gets it correctly, move on to next monster song
