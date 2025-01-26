extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func invisible():
	animated_sprite_2d.play("invisible")
	await animated_sprite_2d.animation_finished
	queue_free()
