extends Node2D

@onready var MAP_DATA: TileMap = $Environment/TileMap
@onready var FLUID_INV: FluidInventory = $FluidInventory
@onready var UISERVICE: Control = $UIService
@onready var player: Player = $Player

@onready var karot_seed: GameItem = load("res://seeds/KarotSeed.tscn").instantiate()

func _ready():
	pass

func _input(event):
	# Plant crops with left click on farmable soil
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if MAP_DATA.get_cell_tile_data(0, MAP_DATA.local_to_map(get_local_mouse_position())).get_custom_data("farmable"):
			MAP_DATA.set_cell(2, MAP_DATA.local_to_map(get_local_mouse_position()), 0, Vector2(7, 1))
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		FLUID_INV.add_item(karot_seed)

func _process(_delta):
	UISERVICE.get_child(0).text = str(player.items)
