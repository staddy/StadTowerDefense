extends RigidBody2D

var rotation = 0.0
var direction = Vector2(-1, 0)
var speed = 500.0
var damage = 5.0

func _ready():
	print("bullet is ready")
	direction = direction.rotated(rotation)
	set_linear_velocity(direction * speed)
	print(get_linear_velocity())
	set_fixed_process(true)

func _on_body_enter(body):
	print("Hit!")
	if body.is_in_group("enemy"):
		body.damage(damage)
		queue_free()
