extends Node

var json = JSON.new()

func saveObj(node:Node):
	var properties = findProperties(node)
	var toStore = {
	}
	for p in properties:
		toStore[p]=node.get(p)
	save(toStore,node)
	pass
	
func findProperties(node:Node)-> Array:
	var filtered := []  
	for entry in node.get_property_list():  
		if(entry["usage"] == 4096):
			filtered.append(entry["name"])  
	return filtered

func save(data,node):
	
	var file = FileAccess.open("res://SaveGames/"+node.name+".txt", FileAccess.WRITE)
	file.store_string(json.stringify(data))

func load(node):
	var file = FileAccess.open("res://SaveGames/"+node.name+".txt", FileAccess.READ)
	var content = file.get_as_text()
	setProperties(content,node)
	
	
func setProperties(text,node):
	var dict = json.parse_string(text)
	for k in dict.keys():
		node.set(str(k),dict[k])
	
	
