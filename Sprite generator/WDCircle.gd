tool
extends WindowDialog


onready var inRadius = $VBoxContainer/Radius/Input
onready var btn = $VBoxContainer/Button

func _on_Create_pressed():
	CreateCircle()
	hide()
	btn.disabled = true
	pass # Replace with function body.

func CreateCircle():
	
	var r = int(inRadius.value)

	var array = PoolByteArray()
	for i in range(r*2):
		for j in range(r*2):
			var ir = int(i-r)
			var jr = int(j-r)
			if( (ir*ir)+(jr*jr) <= r*r ):
				array.append(0xff)
				array.append(0xff)
				array.append(0xff)
				array.append(0xff)
			else:
				array.append(0)
				array.append(0)
				array.append(0)
				array.append(0)
	
	var img = Image.new()
	img.create_from_data(r*2,r*2,false,Image.FORMAT_RGBA8,array)
	img.save_png("res://Circle_r"+str(r)+"px.png")
	

func _on_Input_changed(value):
	var r = int(inRadius.value)

	if(r != 0 ):
		btn.disabled = false
	else:
		btn.disabled = true
	pass # Replace with function body.


func _on_WindowDialog_about_to_show():
	_on_Input_changed(0)
	pass # Replace with function body.



