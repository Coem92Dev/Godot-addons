tool
extends WindowDialog


onready var inWidth = $VBoxContainer/Width/Input
onready var inHeight = $VBoxContainer/Height/Input
onready var btn = $VBoxContainer/Button

func _on_Create_pressed():
	CreateSquare()
	hide()
	btn.disabled = true
	pass # Replace with function body.

func CreateSquare():
	
	var w = int(inWidth.value)
	var h = int(inHeight.value)
	var array = PoolByteArray()
	for i in range(w):
		for j in range(h):
			array.append(0xff)
			array.append(0xff)
			array.append(0xff)
			array.append(0xff)
	
	var img = Image.new()
	img.create_from_data(w,h,false,Image.FORMAT_RGBA8,array)
	img.save_png("res://Square "+str(w)+"x"+str(h)+"px.png")
	

func _on_Input_changed(value):
	var w = int(inWidth.value)
	var h = int(inHeight.value)
	if(w != 0 && h != 0):
		btn.disabled = false
	else:
		btn.disabled = true
	pass # Replace with function body.


func _on_WindowDialog_about_to_show():
	_on_Input_changed(0)
	pass # Replace with function body.



