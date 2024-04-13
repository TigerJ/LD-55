extends Node2D
@onready var player = $Player
@onready var camera_2d = $Camera2D

@onready var level_piece_center = $LevelPieceCenter
@onready var level_piece_left = $LevelPieceLeft
@onready var level_piece_top_left = $LevelPieceTopLeft
@onready var level_piece_bottom_left = $LevelPieceBottomLeft
@onready var level_piece_top = $LevelPieceTop
@onready var level_piece_top_right = $LevelPieceTopRight
@onready var level_piece_right = $LevelPieceRight
@onready var level_piece_bottom = $LevelPieceBottom
@onready var level_piece_bottom_right = $LevelPieceBottomRight



func _ready():
	#center
	level_piece_center.level_piece_top_left=level_piece_top_left
	level_piece_center.level_piece_left=level_piece_left
	level_piece_center.level_piece_bottom_left=level_piece_bottom_left
	level_piece_center.level_piece_top=level_piece_top
	level_piece_center.level_piece_bottom=level_piece_bottom
	level_piece_center.level_piece_top_right=level_piece_top_right
	level_piece_center.level_piece_right=level_piece_right
	level_piece_center.level_piece_bottom_right=level_piece_bottom_right
	#top left
	level_piece_top_left.level_piece_right=level_piece_top
	level_piece_top_left.level_piece_bottom=level_piece_left
	level_piece_top_left.level_piece_bottom_right=level_piece_center
	#left
	level_piece_left.level_piece_right = level_piece_center
	level_piece_left.level_piece_top = level_piece_top_left
	level_piece_left.level_piece_bottom = level_piece_bottom_left
	level_piece_left.level_piece_bottom_right=level_piece_bottom
	level_piece_left.level_piece_top_right=level_piece_top
	
	#bottom left
	level_piece_bottom_left.level_piece_top_right=level_piece_center
	level_piece_bottom_left.level_piece_top=level_piece_left
	level_piece_bottom_left.level_piece_right=level_piece_bottom
	#top right
	level_piece_top_right.level_piece_left=level_piece_top
	level_piece_top_right.level_piece_bottom_left=level_piece_center
	level_piece_top_right.level_piece_bottom=level_piece_right
	#right
	level_piece_right.level_piece_top=level_piece_top_right
	level_piece_right.level_piece_bottom=level_piece_bottom_right
	level_piece_right.level_piece_left=level_piece_center
	level_piece_right.level_piece_top_left=level_piece_top
	level_piece_right.level_piece_bottom_left=level_piece_bottom
	#bottom right
	level_piece_bottom_right.level_piece_top_left=level_piece_center
	level_piece_bottom_right.level_piece_top=level_piece_right
	level_piece_bottom_right.level_piece_left=level_piece_bottom
	#top
	level_piece_top.level_piece_left=level_piece_top_left
	level_piece_top.level_piece_right = level_piece_top_right
	level_piece_top.level_piece_bottom_left=level_piece_left
	level_piece_top.level_piece_bottom_right=level_piece_right
	level_piece_top.level_piece_bottom=level_piece_center
	#bottom
	level_piece_bottom.level_piece_left=level_piece_bottom_left
	level_piece_bottom.level_piece_top_left=level_piece_left
	level_piece_bottom.level_piece_top=level_piece_center
	level_piece_bottom.level_piece_top_right=level_piece_right
	level_piece_bottom.level_piece_right=level_piece_bottom_right
	

func _process(delta):
	camera_2d.position=player.position

