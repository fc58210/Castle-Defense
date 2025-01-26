extends CharacterBody2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_destroy_body_entered(body: Node2D) -> void:
	animated_sprite_2d.play("destructed")
	if animated_sprite_2d.animation_finished:
		animated_sprite_2d.play("invisible")
		collision_shape_2d.disabled = true
		self.collision_layer = 0  # Remove o nó de todas as camadas de colisão
		self.collision_mask = 0   #
