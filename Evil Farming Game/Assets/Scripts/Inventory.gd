extends Node
class_name Inventory

var _inventory: Array[InventoryItem] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	load_inventory(get_children())
	print(_inventory)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_inventory(inventory_items: Array):
	for each in inventory_items:
		if each is InventoryItem:
			_inventory.append(each)
