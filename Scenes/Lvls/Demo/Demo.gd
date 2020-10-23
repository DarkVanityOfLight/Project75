extends Node2D

const player = preload("res://Scenes/Player/Player.tscn")


func _ready():
	var player_instance = player.instance()
	player_instance.position = $Spawn.position
	add_child(player_instance)	
