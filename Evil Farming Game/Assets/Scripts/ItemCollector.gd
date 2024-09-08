extends Node2D
class_name ItemCollector

@onready var COLLECTION: Area2D = $Collection
@onready var LABEL: Label = $Label
@onready var DEPOSIT_TIMER: Timer = $DepositTimer

@export var seeking_item: PackedScene
@export var deposit_timer_length: float

var ready_to_deposit: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_player_delivery() -> void:
	ready_to_deposit = false
	DEPOSIT_TIMER.start(deposit_timer_length)

func can_deposit() -> bool:
	return ready_to_deposit

func _on_deposit_timer_timeout():
	ready_to_deposit = true
