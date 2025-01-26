extends CharacterBody2D

const SPEED = 60
var direction = 1
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func _process(delta: float) -> void:
	
	if ray_cast_2d.is_colliding():
		direction = 0
	else:
		direction = 1
		
	position.x += direction * SPEED * delta
