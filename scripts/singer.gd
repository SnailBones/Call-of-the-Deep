extends AudioStreamPlayer2D

const WAVE = preload("res://characters/wave.tscn")
const WAVE_COUNT = 120

func sing():
		play()
		for i in WAVE_COUNT:
			var wave = WAVE.instantiate()
			wave.rotation = float(i) / WAVE_COUNT * 360
			add_child(wave)
