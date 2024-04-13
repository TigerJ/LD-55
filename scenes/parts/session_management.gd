extends Node2D

const LEVEL_PIECE_1 = preload("res://scenes/parts/level_piece_1.tscn")

var piece_list:Array

func _ready():
	piece_list.append(LEVEL_PIECE_1)

func _input(event):
	if event.is_action_pressed("quit"):
		get_tree().quit()

func pull_piece()->PackedScene:
	return piece_list.pick_random()
