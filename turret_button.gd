extends TextureButton

var turret
var preview

func _ready():
	pass

func get_drag_data(pos):
	print("get drag data")
	turret = load("res://turret.tscn").instance()
	preview = load("res://turret.tscn").instance()
	preview.canShoot = false
	set_drag_preview(preview)
	return [preview, turret]

func can_drop_data(pos, data):
	return true

func drop_data(pos, data):
	pass