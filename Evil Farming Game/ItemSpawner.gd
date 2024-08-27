# Spawn an instance of an item above self, and replace it after x seconds if it is removed
extends Node2D

# Ref to item being picked up
@export var ITEM: PackedScene = null

var item_ready: bool = false

func _ready():
	# SPAWN THE ITEM
	item_ready = spawn_new_item(ITEM.instantiate())

func _process(_delta):
	# Continue to check if the item is in range
	if not item_ready:
		item_ready = spawn_new_item(ITEM.instantiate())

# Spawn ITEM above self
func spawn_new_item(item: Node) -> bool:
	var new_node = item
	new_node.position = position
	get_parent().add_child.call_deferred(new_node)
	item_ready = true
	return true

# Will trigger the spawning of a new item by toggling the flag
func _item_is_removed():
	pass
