extends TextureRect
class_name InventoryUIBox

@onready var ITEM_TEXTURE: TextureRect = $ItemTexture
@onready var ITEM_COUNT: Label = $ItemCount

var item_sprite: Texture2D
var item_name: String
var item_count: int

func _process(_delta):
	ITEM_TEXTURE.texture = item_sprite
	ITEM_COUNT.text = str(item_count)
