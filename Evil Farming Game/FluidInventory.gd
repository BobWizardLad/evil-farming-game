extends Node
class_name FluidInventory

@export var inventory: Dictionary

func _ready():
	inventory = {}

# Adds an item to the inventory, or adds to an existing item's
# total. Takes in a GameItem object to be added.
# Returns itself for function chaining.
func add_item(item: GameItem) -> Node:
	if inventory.has(item.item_name):
		inventory[item.item_name] += 1
	else:
		inventory[item.item_name] = 1
	return self

# Removes an item from the inventory. If item is not found, this
# will do nothing. Takes in a GameItem to reference what to decrement.
# Returns itself for function chaining.
func remove_item(item: GameItem) -> Node:
	if inventory.has(item.item_name):
		inventory[item.item_name] -= 1
	else:
		print("At FluidInventory.gd remove_item(): item not in inventory.")
		return null
	return self

