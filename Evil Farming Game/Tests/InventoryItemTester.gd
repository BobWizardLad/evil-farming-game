extends Node2D

@onready var item_sprite: Sprite2D = $Sprite2D
@onready var inventory_item: InventoryItem = $InventoryItem

@export var inventory: Inventory
@onready var carrot: Item = load("res://Assets/Resources/Items/carrot.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_button_pressed() -> void:
	inventory.add_item(carrot)

func _on_button_2_pressed() -> void:
	inventory.remove_item(carrot)
