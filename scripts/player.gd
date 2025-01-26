extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var timer: Timer = $AnimatedSprite2D/Timer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
var isAttacking = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and not isAttacking:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	
	# Flip the character based on direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	# Handle attack input
	if Input.is_action_just_pressed("Attack") and not isAttacking:
		animated_sprite_2d.play("Slash")
		isAttacking = true
		$"Attack Area/CollisionShape2D".disabled = false
		timer.start()  # Inicia o Timer para controlar a duração do ataque
		velocity.x = 0  # Stops movement during attack
		return  # Exit to prioritize attack animation

	# Handle animations
	if not isAttacking:
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("idle")
			else:
				animated_sprite_2d.play("Run")
		else:
			animated_sprite_2d.play("Jump")

	# Handle movement
	if direction and not isAttacking:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()




func _on_timer_timeout() -> void:
	if isAttacking == true:
		isAttacking = false
		$"Attack Area/CollisionShape2D".disabled = true
