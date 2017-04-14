extends Control

var cooldown = 0.1
var timer = 0.0
var canShoot = true

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	timer -= delta
	if (timer < 0.0):
		timer = 0

func shoot():
	if (canShoot and timer <= 0.0):
		var bullet = load("res://bullet.tscn").instance()
		bullet.rotation = get_node("Barrel").get_rot()
		bullet.set_pos(get_pos() + get_node("Barrel").get_pos())
		get_parent().add_child(bullet)
		timer = cooldown