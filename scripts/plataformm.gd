extends AnimatableBody2D

const SPEED = 80

var direction = 1

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var ray_cast_2_direita: RayCast2D = $RayCast2Direita

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_2_direita.is_colliding():
		direction = -1
		sprite_2d.flip_h = true
	if ray_cast_2d.is_colliding():
		direction = 1
		sprite_2d.flip_h = false
		
	position.x += direction * SPEED * delta
