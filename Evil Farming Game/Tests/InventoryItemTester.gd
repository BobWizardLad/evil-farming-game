extends Node2D

@onready var item_sprite: Sprite2D = $Sprite2D
@onready var inventory_item: InventoryItem = $InventoryItem

# Called when the node enters the scene tree for the first time.
func _ready():
	item_sprite.texture = inventory_item.item_sprite
