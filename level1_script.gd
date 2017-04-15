extends Node

var waves = ["wave1_1", "wave1_2", "wave1_3", "wave1_4"]
var currentWave = 0
var startTimer = 5.0
var waveWaits = true

func _ready():
	set_fixed_process(true)

func startWave(name):
	for enemy in get_tree().get_nodes_in_group(name):
		enemy.wakeUp()

func waveDead(name):
	if get_tree().get_nodes_in_group(name).size() == 0:
		return true
	else:
		return false

func someoneDead():
	if waveDead(waves[currentWave]):
		if currentWave + 1 < waves.count():
			currentWave += 1
			startTimer = 1.0
			waveWaits = true

func _fixed_process(delta):
	print(startTimer)
	if waveWaits:
		if startTimer <= 0:
			waveWaits = false
			startWave(waves[currentWave])
		else:
			startTimer -= delta
