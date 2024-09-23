extends Control
class_name InventoryUI

@export var INVENTORY_SRC: Inventory
@export var inventory_box_template: PackedScene

@export var INVCONTAINER: HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for each in INVENTORY_SRC._inventory:
		INVCONTAINER.add_child(create_inventory_box_item(each))

func create_inventory_box_item(inv_item: InventoryItem) -> InventoryUIBox:
	var i_box: InventoryUIBox = inventory_box_template.instantiate()
	i_box.item_count = inv_item.item_count
	i_box.item_name = inv_item.item_name
	i_box.item_sprite = inv_item.item_sprite
	return i_box

func _on_inventory_item_added(inv_item: InventoryItem) -> void:
	if INVCONTAINER.get_children().size() >= 1:
		for each in INVCONTAINER.get_children():
			if each.item_name == inv_item.item_name:
				each.item_count += 1
				return
		INVCONTAINER.add_child(create_inventory_box_item(inv_item))
		return
	elif INVCONTAINER.get_children().size() < 1:
		INVCONTAINER.add_child(create_inventory_box_item(inv_item))
		return

func _on_inventory_item_removed(inv_item: InventoryItem) -> void:
	if INVCONTAINER.get_children().size() >= 1:
		for each in INVCONTAINER.get_children():
			if each.item_name == inv_item.item_name:
				each.item_count -= 1
				return
		print("Inventory: Could not find item.")
	if INVCONTAINER.get_children().size() < 1:
		print("Inventory: Attempted to remove an item that does not exist!")
		return
