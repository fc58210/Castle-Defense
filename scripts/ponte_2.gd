extends AnimatableBody2D

const SPEED = 100.0  
var moving_up = false 
var moving_down = false 
@onready var up: RayCast2D = $up
@onready var down: RayCast2D = $down


func _process(delta: float) -> void:
	if moving_up:
		if up.is_colliding():
			moving_up = false
		else:
			position.y -= SPEED * delta 
	
	if moving_down:
			if down.is_colliding(): 
				moving_down = false
			else:
				position.y += SPEED * delta 




func _on_destroy_4_body_entered(body: Node2D) -> void:
	moving_up = true
	moving_down = false
	

func _on_destroy_4_body_exited(body: Node2D) -> void:
	moving_up = false
	moving_down = true
