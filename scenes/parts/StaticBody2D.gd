extends CharacterBody2D

var speed:float = 100

var direction:Vector2 = Vector2.ZERO


func _ready():
	direction = Vector2(1,-1)
	
func _physics_process(delta):
	
	direction.normalized()
	position += direction*speed*delta
	
	move_and_slide()
