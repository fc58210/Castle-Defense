extends CharacterBody2D

class_name firebody

@export var speed = 150.0
var direction = Vector2.ZERO  # Direção será definida pelo dragão
@onready var direita: RayCast2D = $direita
@onready var esquerda: RayCast2D = $esquerda

func _physics_process(delta: float) -> void:
	if esquerda.is_colliding():
		queue_free()
	global_position += direction * speed * delta

func _on_fireball_area_shape_entered(area: Area2D) -> void:
	# Verificar colisão com inimigos
	if area.is_in_group("enemies"):
		area.die()  # Método do inimigo para "morrer"
	if area.is_in_group("prison"):
		area.invisible() 


func _on_fireball_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.die()  # Método do inimigo para "morrer"
	if body.is_in_group("prison"):
		body.invisible() 
	
	# Se a bola de fogo tocar o dragão, não faz nada (não destrói a bola de fogo)
	if body.is_in_group("dragon"):
		print("contacto com dragão")
		# Não faz nada, então a bola de fogo continua se movendo
