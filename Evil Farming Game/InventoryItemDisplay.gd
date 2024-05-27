extends HBoxContainer
# HBoxContainer object acting to display items in the inventory
# Modular format to add infinitely many items to the inventory
# along a standard format
class_name InventoryItemDisplay

# Item's sprite, name, and count to be displayed
var item_sprite: Texture2D
var item_name: String
var item_count: int

# Build the child values to be displayed at frame
func instantiate():
	get_child(0).texture = item_sprite
	get_child(1).text = item_name
	get_child(3).text = String.num_int64(item_count)
