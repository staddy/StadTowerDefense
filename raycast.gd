extends RayCast2D

onready var goesUp = true

func _ready():
	add_exception(get_parent())
	set_fixed_process(true)

func _fixed_process(delta):
	var aimed = false
	if is_colliding():
		var obj = get_collider();
		if obj != null and obj.is_in_group("enemy"):
			aimed = true
			get_parent().get_node("Barrel").set_rot(self.get_rot())
			get_parent().shoot()
	
	if not aimed:
		if(abs(get_rot()) >= 1):
			goesUp = not goesUp
		if goesUp:
			set_rot(get_rot() - 5 * delta)
		else:
			set_rot(get_rot() + 5 * delta)