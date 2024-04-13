extends Node2D

var level_piece_top_left:Node2D = null
var level_piece_top:Node2D = null
var level_piece_top_right:Node2D = null
var level_piece_left:Node2D = null
var level_piece_right:Node2D = null
var level_piece_bottom_left:Node2D = null
var level_piece_bottom:Node2D = null
var level_piece_bottom_right:Node2D = null




func _on_left_area_2d_body_entered(body):
	if body.name=="Player":
		var new_left_piece
		var new_top_left_piece
		var new_bottom_left_piece
		if level_piece_left.level_piece_left == null:
			#instantiate the new piece
			new_left_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_left_piece)
			new_left_piece.position.x=level_piece_left.position.x-640
			new_left_piece.position.y=level_piece_left.position.y
			
			#set the related references
			level_piece_left.level_piece_left=new_left_piece
			level_piece_left.level_piece_top.level_piece_bottom_left=new_left_piece
			level_piece_left.level_piece_bottom.level_piece_top_left=new_left_piece
			
			#set references on the new piece
			new_left_piece.level_piece_top_right = level_piece_left.level_piece_top
			new_left_piece.level_piece_right=level_piece_left
			new_left_piece.level_piece_bottom_right = level_piece_left.level_piece_bottom
		else:
			new_left_piece = level_piece_left.level_piece_left

		if level_piece_left.level_piece_top_left == null:
			#instantiate the new piece
			new_top_left_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_top_left_piece)
			new_top_left_piece.position.x=level_piece_left.position.x-640
			new_top_left_piece.position.y=level_piece_left.position.y-384
			
			#set a reference on the calling piece
			level_piece_left.level_piece_top_left=new_top_left_piece
			level_piece_left.level_piece_top.level_piece_left=new_top_left_piece
			
			#set references on the new piece
			new_top_left_piece.level_piece_right=level_piece_left.level_piece_top
			new_top_left_piece.level_piece_bottom_right = level_piece_left
		else:
			new_top_left_piece=level_piece_left.level_piece_top_left
			
		if level_piece_left.level_piece_bottom_left == null:
			#instantiate the new piece
			new_bottom_left_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_bottom_left_piece)
			new_bottom_left_piece.position.x=level_piece_left.position.x-640
			new_bottom_left_piece.position.y=level_piece_left.position.y+384
			
			#set a reference on the calling piece
			level_piece_left.level_piece_bottom_left=new_bottom_left_piece
			level_piece_left.level_piece_bottom.level_piece_left=new_bottom_left_piece
			
			#set references on the new piece
			new_bottom_left_piece.level_piece_right=level_piece_left.level_piece_bottom
			new_bottom_left_piece.level_piece_top_right = level_piece_left
		else:
			new_bottom_left_piece=level_piece_left.level_piece_bottom_left
			
		if new_left_piece!=null:
			if new_top_left_piece!=null:
				new_left_piece.level_piece_top=new_top_left_piece
				new_top_left_piece.level_piece_bottom=new_left_piece
			if new_bottom_left_piece!=null:
				new_left_piece.level_piece_bottom=new_bottom_left_piece
				new_bottom_left_piece.level_piece_top=new_left_piece
		


func _on_right_area_2d_body_entered(body):
	if body.name=="Player":
		var new_right_piece
		var new_top_right_piece
		var new_bottom_right_piece
		if level_piece_right.level_piece_right == null:
			#instantiate the new piece
			new_right_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_right_piece)
			new_right_piece.position.x=level_piece_right.position.x+640
			new_right_piece.position.y=level_piece_right.position.y
			
			#set the related references
			level_piece_right.level_piece_right=new_right_piece
			level_piece_right.level_piece_top.level_piece_bottom_right=new_right_piece
			level_piece_right.level_piece_bottom.level_piece_top_right=new_right_piece
			
			#set references on the new piece
			new_right_piece.level_piece_top_left = level_piece_right.level_piece_top
			new_right_piece.level_piece_left=level_piece_right
			new_right_piece.level_piece_bottom_left = level_piece_right.level_piece_bottom
		else:
			new_right_piece=level_piece_right.level_piece_right
			
		if level_piece_right.level_piece_top_right == null:
			#instantiate the new piece
			new_top_right_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_top_right_piece)
			new_top_right_piece.position.x=level_piece_right.position.x+640
			new_top_right_piece.position.y=level_piece_right.position.y-384
			
			#set a reference on the calling piece
			level_piece_right.level_piece_top_right=new_top_right_piece
			level_piece_right.level_piece_top.level_piece_right=new_top_right_piece
			
			#set references on the new piece
			new_top_right_piece.level_piece_left=level_piece_right.level_piece_top
			new_top_right_piece.level_piece_bottom_left = level_piece_right
		else:
			new_top_right_piece=level_piece_right.level_piece_top_right
			
		if level_piece_right.level_piece_bottom_right == null:
			#instantiate the new piece
			new_bottom_right_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_bottom_right_piece)
			new_bottom_right_piece.position.x=level_piece_right.position.x+640
			new_bottom_right_piece.position.y=level_piece_right.position.y+384
			
			#set a reference on the calling piece
			level_piece_right.level_piece_bottom_right=new_bottom_right_piece
			level_piece_right.level_piece_bottom.level_piece_right=new_bottom_right_piece
			
			#set references on the new piece
			new_bottom_right_piece.level_piece_left=level_piece_right.level_piece_bottom
			new_bottom_right_piece.level_piece_top_left = level_piece_right
		else:
			new_bottom_right_piece = level_piece_right.level_piece_bottom_right
			
		if new_right_piece!=null:
			if new_top_right_piece!=null:
				new_right_piece.level_piece_top=new_top_right_piece
				new_top_right_piece.level_piece_bottom=new_right_piece
			if new_bottom_right_piece!=null:
				new_right_piece.level_piece_bottom=new_bottom_right_piece
				new_bottom_right_piece.level_piece_top=new_right_piece


func _on_top_area_2d_body_entered(body):
	if body.name=="Player":
		var new_top_piece
		var new_top_left_piece
		var new_top_right_piece
		if level_piece_top.level_piece_top == null:
			#instantiate the new piece
			new_top_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_top_piece)
			new_top_piece.position.x=level_piece_top.position.x
			new_top_piece.position.y=level_piece_top.position.y-384
			
			#set the related references
			level_piece_top.level_piece_top=new_top_piece
			level_piece_top.level_piece_left.level_piece_top_right=new_top_piece
			level_piece_top.level_piece_right.level_piece_top_left=new_top_piece
			
			#set references on the new piece
			new_top_piece.level_piece_bottom_left = level_piece_top.level_piece_left
			new_top_piece.level_piece_bottom = level_piece_top
			new_top_piece.level_piece_bottom_right = level_piece_top.level_piece_right
		else:
			new_top_piece=level_piece_top.level_piece_top
			
		if level_piece_top.level_piece_top_left == null:
			#instantiate the new piece
			new_top_left_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_top_left_piece)
			new_top_left_piece.position.x=level_piece_top.position.x-640
			new_top_left_piece.position.y=level_piece_top.position.y-384
			
			#set a reference on the calling piece
			level_piece_top.level_piece_top_left=new_top_left_piece
			level_piece_top.level_piece_left.level_piece_top=new_top_left_piece
			
			#set references on the new piece
			new_top_left_piece.level_piece_bottom=level_piece_top.level_piece_left
			new_top_left_piece.level_piece_bottom_right = level_piece_top
		else:
			new_top_left_piece=level_piece_top.level_piece_top_left
			
		if level_piece_top.level_piece_top_right == null:
			#instantiate the new piece
			new_top_right_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_top_right_piece)
			new_top_right_piece.position.x=level_piece_top.position.x+640
			new_top_right_piece.position.y=level_piece_top.position.y-384
			
			#set a reference on the calling piece
			level_piece_top.level_piece_top_right = new_top_right_piece
			level_piece_top.level_piece_right.level_piece_top = new_top_right_piece
			
			#set references on the new piece
			new_top_right_piece.level_piece_bottom_left = level_piece_top
			new_top_right_piece.level_piece_bottom = level_piece_top.level_piece_top_right
		else: 
			new_top_right_piece=level_piece_top.level_piece_top_right
			
		if new_top_piece!=null:
			if new_top_left_piece!=null:
				new_top_piece.level_piece_left=new_top_left_piece
				new_top_left_piece.level_piece_right=new_top_piece
			if new_top_right_piece!=null:
				new_top_piece.level_piece_right=new_top_right_piece
				new_top_right_piece.level_piece_left=new_top_piece


func _on_bottom_area_2d_body_entered(body):
	if body.name=="Player":
		var new_bottom_piece
		var new_bottom_left_piece
		var new_bottom_right_piece
		if level_piece_bottom.level_piece_bottom == null:
			#instantiate the new piece
			new_bottom_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_bottom_piece)
			new_bottom_piece.position.x=level_piece_bottom.position.x
			new_bottom_piece.position.y=level_piece_bottom.position.y+384
			
			#set the related references
			level_piece_bottom.level_piece_bottom=new_bottom_piece
			level_piece_bottom.level_piece_left.level_piece_bottom_right=new_bottom_piece
			level_piece_bottom.level_piece_right.level_piece_bottom_left=new_bottom_piece
			
			#set references on the new piece
			new_bottom_piece.level_piece_top_left = level_piece_bottom.level_piece_left
			new_bottom_piece.level_piece_top = level_piece_bottom
			new_bottom_piece.level_piece_top_right = level_piece_bottom.level_piece_right
		else:
			new_bottom_piece=level_piece_bottom.level_piece_bottom
			
		if level_piece_bottom.level_piece_bottom_left == null:
			#instantiate the new piece
			new_bottom_left_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_bottom_left_piece)
			new_bottom_left_piece.position.x=level_piece_bottom.position.x-640
			new_bottom_left_piece.position.y=level_piece_bottom.position.y+384
			
			#set a reference on the calling piece
			level_piece_bottom.level_piece_bottom_left=new_bottom_left_piece
			level_piece_bottom.level_piece_left.level_piece_bottom=new_bottom_left_piece
			
			#set references on the new piece
			new_bottom_left_piece.level_piece_top=level_piece_bottom.level_piece_left
			new_bottom_left_piece.level_piece_top_right = level_piece_bottom
		else:
			new_bottom_left_piece = level_piece_bottom.level_piece_bottom_left
			
		if level_piece_bottom.level_piece_bottom_right == null:
			#instantiate the new piece
			new_bottom_right_piece = SessionManagement.pull_piece().instantiate()
			get_tree().root.call_deferred("add_child",new_bottom_right_piece)
			new_bottom_right_piece.position.x=level_piece_bottom.position.x+640
			new_bottom_right_piece.position.y=level_piece_bottom.position.y+384
			
			#set a reference on the calling piece
			level_piece_bottom.level_piece_bottom_right = new_bottom_right_piece
			level_piece_bottom.level_piece_right.level_piece_bottom = new_bottom_right_piece
			
			#set references on the new piece
			new_bottom_right_piece.level_piece_top_left = level_piece_bottom
			new_bottom_right_piece.level_piece_top = level_piece_bottom.level_piece_right
		else:
			new_bottom_right_piece = level_piece_bottom.level_piece_bottom_right
			
		if new_bottom_piece!=null:
			if new_bottom_left_piece!=null:
				new_bottom_piece.level_piece_left=new_bottom_left_piece
				new_bottom_left_piece.level_piece_right=new_bottom_piece
			if new_bottom_right_piece!=null:
				new_bottom_piece.level_piece_right=new_bottom_right_piece
				new_bottom_right_piece.level_piece_left=new_bottom_piece
