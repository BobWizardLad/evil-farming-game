extends Node
class_name UIService

@onready var INVENTORYCONTAINER: VBoxContainer = $InventoryScroll/InventoryContainer

var INVITEMDISPLAY: Resource = load("res://InventoryItemDisplay.tscn")

# Build the inventory UI by updating existing items
func _rebuild_inventory_interface(inventory: Dictionary):
	for ch in INVENTORYCONTAINER.get_children(): # wipe the InventoryContainer
		ch.queue_free()
	for each in inventory: # build each item's display slice
		var new_item = INVITEMDISPLAY.instantiate()
		new_item.item_sprite = inventory[each].item_sprite
		new_item.item_count = inventory[each].item_count
		new_item.item_name = inventory[each].item_name
		new_item.instantiate()
		INVENTORYCONTAINER.add_child(new_item) 
	# connect inventory amounts
