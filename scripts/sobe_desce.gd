extends AnimatableBody2D

const SPEED = 50.0  # Velocidade do movimento vertical
@onready var ray_cast_2up: RayCast2D = $RayCast2D
@onready var ray_cast_2down: RayCast2D = $RayCast2D2
var direction = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	# Se ray_cast_2up estiver colidindo, move-se para baixo
	if ray_cast_2up.is_colliding():
		direction = 1
	
	# Se ray_cast_2down estiver colidindo, move-se para cima
	elif ray_cast_2down.is_colliding():
		direction = -1
	
	position.y += direction * SPEED * delta
	
		
