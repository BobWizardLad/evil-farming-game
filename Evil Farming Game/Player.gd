extends CharacterBody2D

# Const
@export var SPEED = 100.0
@export var SPRINT_CONST = 2.0

# Child static ref
@onready var INTERACTCOLLIDE: CollisionShape2D = $InteractCollide

# Siblings
@onready var TILEMAP: TileMap = $"../Environment/TileMap"

var real_speed = SPEED
var direction = Vector2.ZERO

func _physics_process(_delta):
	# Move down into the player nav code.
	player_navigate(_delta)
	interact()

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
	velocity = direction.normalized()* real_speed
	
	move_and_slide()
	
	# Zero our values for the next go-around.
	direction = Vector2.ZERO
	velocity = Vector2.ZERO
	real_speed = SPEED

func interact():
	# Get the local tilemap cell and see if it is a workstation; 3 is workstation layer
	if TILEMAP.get_cell_tile_data(3, TILEMAP.local_to_map(position)) != null:
		print(TILEMAP.get_cell_tile_data(3, TILEMAP.local_to_map(position)).get_custom_data("cooking"))
