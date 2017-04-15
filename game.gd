extends TextureFrame

var money = 0
var health 

func _ready():
	set_money(40)
	set_fixed_process(true)

func _fixed_process(delta):
	pass

func set_money(value):
	money = value
	get_node("Money").set_text(str(money))
	
func add_money(value):
	money += value
	get_node("Money").set_text(str(money))
	
func get_money():
	return money

func check_money(value):
	if money >= value:
		return true
	else:
		return false

func spend_money(value):
	if money >= value:
		money -= value
		get_node("Money").set_text(str(money))
		return true
	else:
		return false
	
func can_drop_data(pos, data):
	return true

func drop_data(pos, data):
	if spend_money(20): # использовать переменную
		print("drop data")
		data[1].set_pos(pos)
		data[1].get_node("RayCast2D").set_rot(data[0].get_node("RayCast2D").get_rot())
		add_child(data[1])