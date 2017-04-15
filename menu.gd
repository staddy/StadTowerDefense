extends Control

func _ready():
	print("_ready")
	get_node("Stop").connect("button_down", self, "_on_Stop_pressed")
	get_node("Start").connect("button_down", self, "_on_Start_pressed")

func _on_Stop_pressed():
	print("_on_Stop_pressed")
	get_tree().quit()
	
func _on_Start_pressed():
	print("_on_Start_pressed")
	get_tree().change_scene("res://level1.tscn")