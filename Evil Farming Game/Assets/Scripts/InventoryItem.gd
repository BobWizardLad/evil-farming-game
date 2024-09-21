extends Node
class_name InventoryItem

# InventoryItem configures what Item resource it inherits from
# and the total # of this item in the inventory
@export var item_res: Resource
@export var item_count: int

# Attributes inherited from item_res
var item_name: String
var item_sprite: Texture2D
var is_key_item: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	load_item_res(item_res)

func load_item_res(item: Item) -> void:
	item_name = item.item_name
	item_sprite = item.item_sprite
	is_key_item = item.is_key_item
