extends RigidBody2D

var rotation = 0.0
var direction = Vector2(-1, 0)
var speed = 500.0
var damage = 5.0

func _ready():
	print("bullet is ready")
	direction = direction.rotated(rotation)
	set_linear_velocity(direction * speed)
	set_rot(rotation)
	print(get_linear_velocity())
	set_fixed_process(true)

func _on_body_enter(body):
	print("Hit!")
	if body.is_in_group("enemy"):
		body.damage(damage)
		queue_free()

func _fixed_process(delta):
	var p = get_pos()
	var par = get_parent().get_size()
	if p.x < 0 || p.x > par.width || p.y < 0 || p.y > par.height:
		print("bullet removed")
		queue_free()
