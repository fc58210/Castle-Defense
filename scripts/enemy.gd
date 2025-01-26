extends Node2D

var SPEED = 40

var direction = 1
var dead = false

@onready var ray_cast_2d_direita: RayCast2D = $RayCast2DDireita
@onready var ray_cast_2_esquerda: RayCast2D = $RayCast2Esquerda
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $AnimatedSprite2D/Timer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if ray_cast_2d_direita.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	if ray_cast_2_esquerda.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
		
	position.x += direction * SPEED * delta
	


func _on_killzone_area_entered(area: Area2D) -> void:
	if area.is_in_group("Sword"):
		dead = true
		animated_sprite.play("Dead")
		timer.start()
		



func _on_timer_timeout() -> void:
	if dead == true:
		dead = false
	SPEED = 0
	animated_sprite.play("final_dead")
