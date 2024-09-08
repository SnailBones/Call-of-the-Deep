extends CharacterBody2D
class_name Monster

var monster1 = [
	{
		"rythm": [3.0/8, 1.0/16, 1.0/8, 1.0/8],
		"tune": [1, 1, 1, 1]
	},
	{
		"rythm": [1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/4, 1.0/4, 1.0/4],
		"tune": [-4, -3, -4, -3, -4, -3, -4, -3, -4, -3, -4]
	},
	{
		"rythm": [3.0/16, 1.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 3.0/16 ,1.0/16, 3.0/16, 1.0/16, 3.0/16],
		"tune": [4, 4, 5, 5, 4, 4, 5, 5, 4, 4, 3, 2, 1, 2]
	}
]

var monster2 = [
	{
		"rythm": [1.0/4, 1.0/4, 1.0/16, 1.0/8, 1.0/16, 1.0/4],
		"tune": [1, 1, 0, 1, 2 ,1]
	},
	{
		"rythm": [1.0/16, 1.0/16, 1.0/16, 5.0/16, 1.0/16, 1.0/16, 1.0/16, 5.0/16, 1.0/16, 1.0/16, 1.0/16, 5/16],
		"tune": [1, 2, 4, 6, 1, 0, -3, -7, 1, 0, -1, -2]
	},
	{
		"rythm": [1.0/8, 1.0/8, 1.0/16, 1.0/16, 1.0/8, 1.0/16, 1.0/16, 1.0/16, 1.0/16],
		"tune": [-2, -2, 5, 4, 3, 3, 2, -3]
	}
]
var monster3 = [
	{
		"rythm": [1.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 3.0/16],
		"tune": [-7, -6, -5, -4, -3, -2, -1, 0]
	},
	{
		"rythm": [1.0/16, 3.0/16, 1.0/16, 1.0/16, 1.0/8, 1.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 1.0/16, 1.0/8, 1.0/16, 3.0/16],
		"tune": [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
	},
	{
		"rythm": [1.0/16, 3.0/16, 1.0/16, 3.0/16, 3.0/16, 1.0/16, 3.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16, 1.0/16],
		"tune": [4, 3, 1, 2, 4, 1, 2, 1, 4, 5, 1, 5, 6]
	}
]




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
