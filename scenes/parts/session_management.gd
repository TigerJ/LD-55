extends Node2D

const LEVEL_PIECE_1 = preload("res://scenes/parts/level_piece_1.tscn")
const LEVEL_PIECE_2 = preload("res://scenes/parts/level_piece_2.tscn")
const LEVEL_PIECE_3 = preload("res://scenes/parts/level_piece_3.tscn")
const LEVEL_PIECE_4 = preload("res://scenes/parts/level_piece_4.tscn")


var piece_list:Array

func _ready():
	piece_list.append(LEVEL_PIECE_1)
	#piece_list.append(LEVEL_PIECE_2)
	#piece_list.append(LEVEL_PIECE_3)
	#piece_list.append(LEVEL_PIECE_4)

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func pull_piece()->PackedScene:
	return piece_list.pick_random()
