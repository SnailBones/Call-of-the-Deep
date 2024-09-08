extends Node2D

const TIME_BETWEEN_MONSTERS = 1 # Atmospheric break between monsters.
const TIME_BETWEEN_SONGS = 1 # How quickly monster replies after a sucessful or failed song.
const NOTE_FORGIVENESS = .2 # How innacurate can note timing be
const MAX_FAILS = 3 # Monster kills you on third fail
var time = 0
var noteLength = 0 # Tracking currently played note
var monsterNumber = 1 # 1st, 2nd, or third monster.
var songNumber = 0 # Monster song number. 0 is between monsters.
var fails = 0
var tune = [] 
var rythm = []
var playerSinging = false
var bpm: float = 60
var failedSong = false;

@onready var player: Player = $Player
@onready var monster1: Monster = $Monster
@onready  var monster = monster1

func _ready(): 
	player.sing_signal.connect(onPlayerSing)

func onPlayerSing() -> void:
	if rythm.is_empty():
		player.singTuneless();
	else: 	# if there's a tune to be sung
		#monster.rest(); 
		var note = tune.pop_front();
		if !playerSinging: # If first note
			playerSinging = true
			player.hitNote(note) 
		# Otherwise, check if time since last note is close enough
		else:
			var trueLength = noteLength / (monster.BPM / 60.0)
			var difference = abs(time - trueLength);
			print("note was", trueLength, "your time was", time)
			print("error of ", abs(time - trueLength))
			if difference > NOTE_FORGIVENESS:
				player.missNote(note); # change color and pitch
				failedSong = true;
			else:
				player.hitNote(note)
		noteLength = rythm.pop_front() 
		time = 0;
		if rythm.is_empty(): # When song is completed
			playerSinging = false;
			if failedSong:
				print("failed song")
				fails += 1 
				failedSong = false;
				# TODO: angry monster roar here	
				if fails == MAX_FAILS:  
					die();		
			else:
				print("passed song!")
				songNumber += 1
				time = 0;
			if songNumber > 3: # Completed all songs
				songNumber = 0
				monsterNumber += 1 

func startSong():
	# Load song from monster
	tune = monster.getTune(songNumber)
	rythm = monster.getRythm(songNumber)
	monster.awaken(tune, rythm) # Monster starts to sing

func _physics_process(delta: float) -> void:
	time += delta
	if songNumber == 0: # Atmospheric break between monsters
		if time > TIME_BETWEEN_MONSTERS:
			songNumber = 1
	else: # briefest break between songs
		if monster.isResting() && !playerSinging && time > TIME_BETWEEN_SONGS:
			startSong() 
		# If player gets it correctly, move on to next monster song

func die():
	print("TODO: you died!")
