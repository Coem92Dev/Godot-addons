tool
extends EditorPlugin

var ListPopup = PopupMenu.new()

const WDSquare = preload("res://addons/Sprite generator/WDSquare.tscn")
const WDCircle = preload("res://addons/Sprite generator/WDCircle.tscn")
var panelWDSquare
var panelWDCircle
func _enter_tree():
	
	panelWDSquare = WDSquare.instance()
	panelWDSquare.get_node("VBoxContainer/Button").connect("pressed",self,"updateFileSystem")
	get_editor_interface().add_child(panelWDSquare)
	
	panelWDCircle = WDCircle.instance()
	panelWDCircle.get_node("VBoxContainer/Button").connect("pressed",self,"updateFileSystem")
	get_editor_interface().add_child(panelWDCircle)
	
	ListPopup.add_item("Square png")
	ListPopup.add_item("Circle png")
	ListPopup.add_item("Triangle png")
	ListPopup.add_item("Square svg")
	ListPopup.add_item("Circle svg")
	ListPopup.add_item("Triangle svg")
	
	ListPopup.connect("index_pressed",self,"handleListPopup")

	add_tool_submenu_item ( "Spriter", ListPopup)
	pass

func _exit_tree():
	remove_tool_menu_item ("Spriter")
	pass

func handleListPopup(var id):
	match ListPopup.get_item_text(id):
		"Square png":
			if(panelWDSquare):
				panelWDSquare.popup()
		"Circle png":
			if(panelWDCircle):
				panelWDCircle.popup()
		_:
			print("Not yet implemented")
	

	pass

func updateFileSystem():
	get_editor_interface().get_resource_filesystem().scan()
