extends Node
class_name UIService

@onready var ItemText: Label = $InventoryPeek/Label
@onready var ItemImg: TextureRect = $InventoryPeek/Item

func _ready():
	ItemText.text = "EMPTY"

func set_item_peek(count: int):
	ItemText.text = String.num_int64(count)
	ItemImg.texture = load("res://karot.png")
	
