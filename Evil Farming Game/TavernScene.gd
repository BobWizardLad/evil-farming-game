extends Node2D

@onready var MAP_DATA: TileMap = $Environment/TileMap
@onready var UISERVICE: Control = $UIService
@onready var player: Player = $Player

func _ready():
	pass

func _input(event):
	pass

func _process(_delta):
	UISERVICE.get_child(0).text = str(player.items)
