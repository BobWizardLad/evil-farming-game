# Generic object class providing high_level function to all
# traced and counted "items" in the game.
extends Node
class_name GameItem

@export var item_name: String
@export var item_count: int
@export var item_sprite: Texture2D
@export var is_key_item: bool

# Return a dictionary of all attributes keyed by name of the object's FIRST
# component child. GameItems will only be one thing, so multi-component
# objects will default to their first component in the tree.
func get_obj_data() -> Dictionary:
	var output: Dictionary = {}
	for each in get_children():
		if each.has_obj_data():
			output = each.get_component_data()
	return output
