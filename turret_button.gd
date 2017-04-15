extends TextureButton

var turret
var preview

func _ready():
	pass

func get_drag_data(pos):
	if get_parent().check_money(20): # использовать переменную
		turret = load("res://turret.tscn").instance()
		preview = load("res://turret.tscn").instance()
		preview.canShoot = false
		set_drag_preview(preview)
		return [preview, turret]

func can_drop_data(pos, data):
	return true

func drop_data(pos, data):
	pass