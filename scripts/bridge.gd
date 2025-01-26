extends AnimatableBody2D

const SPEED = 100.0  
var moving_up = false 
var moving_down = false 
@onready var ray_cast_2d_2: RayCast2D = $RayCast2D2
@onready var ray_cast_2d: RayCast2D = $RayCast2D

func _process(delta: float) -> void:
	if moving_up:
		if ray_cast_2d_2.is_colliding():
			moving_up = false
		else:
			position.y -= SPEED * delta 
	
	if moving_down:
			if ray_cast_2d.is_colliding(): 
				moving_down = false
			else:
				position.y += SPEED * delta 

func _on_destroy_2_body_entered(body: Node2D) -> void:
	moving_up = true
	moving_down = false  

func _on_destroy_2_body_exited(body: Node2D) -> void:
	moving_down = true
	moving_up = false
