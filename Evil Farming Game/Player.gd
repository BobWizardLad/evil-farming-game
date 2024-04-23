extends CharacterBody2D

@export var SPEED = 100.0
@export var SPRINT_CONST = 2.0

var real_speed = SPEED
var direction = Vector2.ZERO

func _physics_process(_delta):
	# Move down into the player nav code.
	player_navigate(_delta)

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
