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