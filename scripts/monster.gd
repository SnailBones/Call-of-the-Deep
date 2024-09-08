extends CharacterBody2D
class_name Monster

var monster1 = [
	{
		"rythm": [1, 1, 1],
		"tune": [0, 7, -12]
	},
	{
		"rythm": [1, .5, .5, 1],
		"tune": [0, 3, 7, -12]
	},
	{
		"rythm": [1, .5, .5, 1, .5, .5],
		"tune": [0, 3, 7, -12, 12, -24]
	}
]

# TODO: Define monster 2 and 3 as above.
var monster2 = monster1
var monster3 = monster2

@export var monsterID = 1
@export var bpm = 120
@export var transpose = 0
#@export var song_count = 3
@export var songCount = 1 # Just for quick testing
@export var patience = 3 # How long the monster waits for a response before getting angry

var allSongs = [monster1, monster2, monster3]
var mySongs = allSongs[monsterID-1]

func getTune(num: int):
	if num > songCount:
		printerr("invalid index", num)
	return mySongs[num-1].tune.duplicate()
	
func getRythm(num: int):
	if num > songCount:
		printerr("invalid index", num)
	return mySongs[num-1].rythm.duplicate()
