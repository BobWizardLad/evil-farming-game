# Spawn an instance of an item above self, and replace it after x seconds if it is removed
extends Node2D
class_name ItemSpawner

@onready var SPAWN_TIMER: Timer = $SpawnTimer

# Ref to item being picked up
@export var ITEM: Resource = null
@export var spawn_delay: float = 0.0

var current_item: Item = null
var item_ready: bool = false

func _ready():
	SPAWN_TIMER.start(spawn_delay)

func _process(_delta):
	if current_item == null:
		item_ready = false
	
	if not item_ready and SPAWN_TIMER.is_stopped():
		SPAWN_TIMER.start(spawn_delay)

# Spawn ITEM above self
func _spawn_new_item() -> void:
	var new_node: Item = Item.new()
	new_node.position = position
	current_item = new_node
	get_parent().add_child.call_deferred(new_node)
	item_ready = true
