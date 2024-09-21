extends Control

@export var INVENTORY_SRC: Inventory
@onready var inventory_box_template: PackedScene = load("res://Scenes/inventory_ui_box.tscn")

@onready var INVCONTAINER: VBoxContainer = $InvContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_inventory(INVENTORY_SRC)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_inventory(source: Inventory):
	for each in source._inventory:
		var i_box: InventoryUIBox = inventory_box_template.instantiate()
		i_box.item_count = each.item_count
		i_box.item_name = each.item_name
		i_box.item_sprite = each.item_sprite
		INVCONTAINER.add_child(i_box)
