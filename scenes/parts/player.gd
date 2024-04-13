extends CharacterBody2D

var speed:float = 200

var direction:Vector2 = Vector2.ZERO
@onready var animated_sprite_2d = $AnimatedSprite2D

func _process(delta):
	if direction != Vector2.ZERO:
		animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("default")

func _physics_process(delta):
	
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("right"):
		direction += Vector2(1,0)
		animated_sprite_2d.flip_h=false
	if Input.is_action_pressed("left"):
		direction += Vector2(-1,0)
		animated_sprite_2d.flip_h=true		
	if Input.is_action_pressed("up"):
		direction += Vector2(0,-1)
	if Input.is_action_pressed("down"):
		direction += Vector2(0,1)
	direction = direction.normalized()
	position+=delta*direction*speed
	
	move_and_slide()
