extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_2d_direita: RayCast2D = $RayCast2DDireita
@onready var ray_cast_2_esquerda: RayCast2D = $RayCast2Esquerda
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_2d_direita.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_2_esquerda.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta

func die():
	animated_sprite.play("die")
	await animated_sprite.animation_finished
	queue_free()
