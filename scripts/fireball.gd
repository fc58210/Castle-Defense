extends Area2D

@export var speed = 150.0
var direction = Vector2.ZERO  # Direção será definida pelo dragão

func _ready() -> void:
	# Iniciar a animação, se aplicável
	$AnimatedSprite2D.play("default")

func _physics_process(delta: float) -> void:
	# Movimentar a fireball na direção configurada
	global_position += direction * speed * delta

func _on_fireball_area_shape_entered(area: Area2D) -> void:
	# Verificar colisão com inimigos
	if area.is_in_group("enemies"):
		area.die()  # Método do inimigo para "morrer"
	if area.is_in_group("prison"):
		area.invisible()  # Método do inimigo para "morrer"
