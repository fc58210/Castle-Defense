extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var forward: Label = $AnimatedSprite2D/forward
@onready var left: Label = $AnimatedSprite2D/Left
@onready var follow: Label = $AnimatedSprite2D/Follow


func _physics_process(delta: float) -> void:
	# Movimento horizontal controlado pelo Player 2
	var horizontal_movement = Input.get_axis("move_left", "move_right")

	# Atualizar a velocidade do dragão
	velocity.x = horizontal_movement
	
	# Mostrar apenas o Label correspondente
	update_labels(horizontal_movement)
	# Mover o dragão
	move_and_slide()
	
func update_labels(horizontal_movement) -> void:
	# Esconde todos os Labels inicialmente
	forward.visible = false
	left.visible = false
	follow.visible = false

	# Determina qual Label deve ser mostrado
	if horizontal_movement > 0:
		forward.visible = true  # Mostrar o Label de "Move Forward"
	elif horizontal_movement < 0:
		left.visible = true  # Mostrar o Label de "Move Left"
