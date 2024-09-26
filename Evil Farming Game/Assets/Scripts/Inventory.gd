extends Node
class_name Inventory

@onready var INVENTORY_ITEM_SRC: PackedScene = load("res://Scenes/inventory_item.tscn")

# Stores a list of references to the loaded inventory items;
# Caches the get_children call while excludes non-inventoryItems
var _inventory: Array[InventoryItem] = []

signal inventory_item_added
signal inventory_item_removed

# Called when the node enters the scene tree for the first time.
func _ready():
	load_inventory(get_children())

func load_inventory(inventory_items: Array):
	for each in inventory_items:
		if each is InventoryItem:
			add_item(load(each.item_res.resource_path))

# Add an item to the inventory tree
func add_item(item: Item) -> void: #TEST
	var inv_item: InventoryItem = INVENTORY_ITEM_SRC.instantiate()
	inv_item.load_item_res(item)
	if _inventory.size() >= 1:
		for each in _inventory:
			if each.item_name == inv_item.item_name:
				_inventory[(_inventory.find(each))].item_count += 1
				emit_signal("inventory_item_added", inv_item)
				return
		add_child(inv_item)
		_inventory.append(inv_item)
	elif _inventory.size() == 0:
		add_child(inv_item)
		_inventory.append(inv_item)
	
	emit_signal("inventory_item_added", inv_item)

# Remove an item from the inventory tree
func remove_item(item: Item) -> void: #TEST
	var inv_item: InventoryItem = INVENTORY_ITEM_SRC.instantiate()
	inv_item.load_item_res(item)
	for each in _inventory:
		if item.item_name == each.item_name && each.item_count <= 1:
			var temp = _inventory[_inventory.find(each)]
			_inventory.remove_at(_inventory.find(each))
			temp.queue_free()
			break
		elif item.item_name == each.item_name && each.item_count > 1:
			each.item_count -= 1
			break
		else:
			pass
	emit_signal("inventory_item_removed", inv_item)
