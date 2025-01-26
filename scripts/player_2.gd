extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var up: Label = $AnimatedSprite2D/Up
@onready var down: Label = $AnimatedSprite2D/Down


func _physics_process(delta: float) -> void:
	# Movimento horizontal controlado pelo Player 2
	var vertical_movement = Input.get_axis("move_up", "move_down")
	
	# Mostrar apenas o Label correspondente
	update_labels(vertical_movement)
	# Mover o dragão
	move_and_slide()
	
func update_labels(vertical_movement) -> void:
	# Esconde todos os Labels inicialmente
	up.visible = false
	down.visible = false

	# Determina qual Label deve ser mostrado
	if vertical_movement > 0:
		up.visible = true  # Mostrar o Label de "Move Forward"
	elif vertical_movement < 0:
		down.visible = true  # Mostrar o Label de "Move Left"
