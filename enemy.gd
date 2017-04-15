extends RigidBody2D

var health = 100.0
var speed = 10.0
var healthBar
var basicPosY

func _ready():
	add_to_group("enemy")
	healthBar = get_node("Health")
	healthBar.set_max(health)
	healthBar.set_value(health)
	basicPosY = get_pos().y

func _fixed_process(delta):
	if health <= 0:
		queue_free()
		get_parent().add_money(5)
		get_parent().get_node("Script").someoneDead()
	
	var pos = get_pos()
	var maxPos = get_parent().get_size().x
	if (pos.x / maxPos) >= 1.0:
		# отнять здоровье базы
		
		queue_free()
		get_parent().get_node("Script").someoneDead()
	
	var vel = get_linear_velocity()
	var xVel = vel.x
	if (xVel < speed):
		set_linear_velocity(Vector2(xVel + 50.0 * delta, vel.y))
	
	if (pos.y > basicPosY):
		set_linear_velocity(Vector2(get_linear_velocity().x, -50 * rand_range(0.5, 1.0)))

func damage(value):
	health -= value
	healthBar.set_value(health)

func wakeUp():
	set_sleeping(false)
	set_fixed_process(true)
	set_gravity_scale(1)
	set_linear_velocity(Vector2(speed, 0))