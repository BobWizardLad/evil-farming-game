extends CharacterBody2D
class_name Player

# Const
@export var SPEED = 100.0
@export var SPRINT_CONST = 2.0
@export var items = 0

# Children
@onready var INTERACT: Area2D = $InteractArea
@onready var ITEMS: Label = $Control/Label

# Flag for certainn interactables active
var interactable: bool = false
var interactive_object: Node

var real_speed = SPEED
var direction = Vector2.ZERO

func _ready():
	pass

func _process(delta):
	ITEMS.text = str(items)

func _physics_process(_delta):
	# Move down into the player nav code.
	player_navigate(_delta)
	player_input(_delta)
	interact()

func player_input(_delta):
	if Input.is_action_pressed("interact") && interactable:
		if interactive_object.get_parent() is ItemCollector and items > 0 and interactive_object.get_parent().can_deposit():
			items -= 1
			interactive_object.get_parent().on_player_delivery()

func player_navigate(delta):
	# Sprinting for the massive map, multiply the 
	if Input.is_action_pressed("sprint"):
		real_speed = SPEED * SPRINT_CONST
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("player_up"):
		direction += Vector2.UP
	if Input.is_action_pressed("player_down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("player_right"):
		direction += Vector2.RIGHT
	if Input.is_action_pressed("player_left"):
		direction += Vector2.LEFT
	
	# Final movement calculation
	velocity = direction.normalized() * real_speed
	
	move_and_slide()
	
	# Zero our values for the next go-around.
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	real_speed = SPEED

func interact():
	if INTERACT.has_overlapping_bodies():
		var item = INTERACT.get_overlapping_bodies()[0]
		if item.is_in_group("Item"):
			item.queue_free()
			items += 1
			

func _on_interact_area_area_entered(area):
	if area.get_parent().name == "ItemCollector":
		interactable = true
		interactive_object = area

func _on_interact_area_area_exited(area):
	interactable = false
	interactive_object = null
