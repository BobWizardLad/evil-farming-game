extends TextureRect
class_name InventoryUIBox

@onready var ITEM_TEXTURE: TextureRect = $ItemTexture

var item_sprite: Texture2D
var item_name: String
var item_count: int

func _ready():
	ITEM_TEXTURE.texture = item_sprite
