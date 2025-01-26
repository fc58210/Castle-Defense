extends Area2D

var dead = false

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var timer: Timer = $AnimatedSprite2D/Timer

func _process(delta: float) -> void:
	if dead == false:
		animated_sprite_2d.play("Statue");
			



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Sword"):
		dead = true;
		animated_sprite_2d.play("Explosion");
		timer.start()
			



func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "Explosion":
		animated_sprite_2d.play("empty")
		queue_free()


func _on_timer_timeout() -> void:
	if animated_sprite_2d.animation == "Explosion":
		animated_sprite_2d.play("empty")
		queue_free()
