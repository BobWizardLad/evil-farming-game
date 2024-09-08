extends Node
class_name FluidInventory

@export var inventory: Dictionary

signal add_item_update

func _ready():
	inventory = {}

# Increments the item's count or adds it if it does not exist.
# Takes in a GameItem object to be added.
# Returns itself for function chaining.
func add_item(item: GameItem) -> Node:
	if inventory.has(item.item_name):
		inventory[item.item_name].item_count += 1
	else:
		inventory[item.item_name] = item
	# Pass the dictionary along to the UI to update the values
	emit_signal("add_item_update", inventory)
	return self

# Decrements the item's count or removes it entirely if count
# becomes 0 or less. If item is not found, this will do nothing.
# Takes in a GameItem to reference what to decrement.
# Returns itself for function chaining.
func remove_item(item: GameItem) -> Node:
	if inventory.has(item.item_name):
		inventory[item.item_name].item_count -= 1
		if inventory[item.item_name].item_count <= 0:
			inventory.erase(item.item_name)
	else:
		print("At FluidInventory.gd remove_item(): item not in inventory.")
		return null
	emit_signal("add_item_update", inventory)
	return self

