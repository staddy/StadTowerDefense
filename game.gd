extends TextureFrame

var money = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	set_money(money + delta)

func set_money(value):
	money = value
	get_node("Money").set_text(str(money))
	
func get_money():
	return money
	
func can_drop_data(pos, data):
	return true

func drop_data(pos, data):
	print("drop data")
	data[1].set_pos(pos)
	data[1].get_node("RayCast2D").set_rot(data[0].get_node("RayCast2D").get_rot())
	add_child(data[1])
	pass