extends Node
class_name Inventory

@onready var INVENTORY_ITEM_SRC: PackedScene = load("res://Scenes/inventory_item.tscn")

var _inventory: Array[InventoryItem] = []

signal inventory_changed

# Called when the node enters the scene tree for the first time.
func _ready():
	load_inventory(get_children())

func load_inventory(inventory_items: Array):
	for each in inventory_items:
		if each is InventoryItem:
			_inventory.append(each)

# Add an item to the inventory tree
func add_item(item: Item) -> void: #TEST
	var inv_item: InventoryItem = INVENTORY_ITEM_SRC.instantiate()
	inv_item.load_item_res(item)
	add_child(inv_item)
	_inventory.append(inv_item)
	emit_signal("inventory_changed", true, inv_item)

# Remove an item from the inventory tree
func remove_item(item: Item) -> void: #TEST
	var inv_item: InventoryItem = null
	for each in _inventory:
		if item.item_name == each.item_name:
			inv_item = INVENTORY_ITEM_SRC.instantiate()
			inv_item.load_item_res(item)
			_inventory.remove_at(_inventory.find(each))
			break
		else:
			pass
	emit_signal("inventory_changed", false, inv_item)
