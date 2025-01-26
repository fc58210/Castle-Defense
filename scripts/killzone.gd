extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("fireball"):
		# Se for uma fireball, não faz nada e sai da função
		return
	print (" you died") # Replace with function body.
	Engine.time_scale = 0.2
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene() # Replace with function body.
