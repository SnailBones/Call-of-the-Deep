extends AudioStreamPlayer2D

const WAVE = preload("res://characters/wave.tscn")
#const WAVE_COUNT = 240
const WAVE_COUNT = 120
const SPEED = 50
const SPAWN_DISTANCE = 12

# todo: move to music util?
func noteToFreq(note):
	var freq = pow(2, note/12.0) # 2 to the power of note
	return freq

func playNote(note):
	var pitch=noteToFreq(note)
	pitch_scale = pitch
	#player.volume_db = vol-40+2/pitch # play lower notes louder
	play()

func sing(note = 0):
		playNote(note)
		for i in WAVE_COUNT:
			var wave = WAVE.instantiate()
			var rotation = float(i) / WAVE_COUNT * 360
			var direction = Vector2.UP.rotated(rotation)
			wave.position = direction*SPAWN_DISTANCE
			wave.velocity = direction*SPEED
			add_child(wave)
