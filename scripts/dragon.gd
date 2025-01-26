extends CharacterBody2D

var fireball = preload("res://scenes/firebody.tscn")  # Certifique-se de que o caminho está correto
const SPEED_HORIZONTAL = 200.0
const SPEED_VERTICAL = 150.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Movimento horizontal controlado pelo Player 2
	var horizontal_movement = Input.get_axis("move_left", "move_right") * SPEED_HORIZONTAL
	
	# Movimento vertical controlado pelo Player 1
	var vertical_movement = Input.get_axis("move_up", "move_down") * SPEED_VERTICAL

	# Atualizar a velocidade do dragão
	velocity.x = horizontal_movement
	velocity.y = vertical_movement
	
	# Flip do personagem baseado na direção horizontal
	if horizontal_movement > 0:
		animated_sprite_2d.flip_h = false
	elif horizontal_movement < 0:
		animated_sprite_2d.flip_h = true
	
	# Detectar disparo da fireball
	if Input.is_action_just_pressed("fireball"):
		shoot_fireball()
	
	# Mover o dragão
	move_and_slide()

func shoot_fireball() -> void:
	# Instanciar a fireball
	var fire = fireball.instantiate()

	# Configurar a posição inicial da fireball
	if animated_sprite_2d.flip_h:
		# Se o dragão está virado para a esquerda (flip ativado), a fireball sai da parte esquerda
		fire.global_position = global_position - Vector2(100, 10)  # Ajuste a distância atrás do dragão
	else:
		# Se o dragão está virado para a direita, a fireball sai da parte direita
		fire.global_position = global_position + Vector2(20, -10)  # Ajuste a distância atrás do dragão

	# Configurar a direção baseada no flip do dragão
	fire.direction = Vector2(1, 0) if not animated_sprite_2d.flip_h else Vector2(-1, 0)

	# Adicionar a fireball à cena principal
	get_parent().add_child(fire)
