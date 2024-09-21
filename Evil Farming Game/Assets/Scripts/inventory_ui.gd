extends Control

@export var INVENTORY_SRC: Inventory
@onready var inventory_box_template: PackedScene = load("res://Scenes/inventory_ui_box.tscn")

@onready var INVCONTAINER: VBoxContainer = $InvContainer

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

func _on_inventory_changed(added: bool, inv_item: InventoryItem) -> void:
	print("CHANGE")
	if added:
		INVCONTAINER.add_child(create_inventory_box_item(inv_item))
	elif not added:
		for each in INVCONTAINER.get_children():
			if each.item_name == inv_item.item_name:
				each.queue_free()
				break
	else:
		pass
