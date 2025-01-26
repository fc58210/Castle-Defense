extends Camera2D

@export var move_speed = 10
@export var zoom_speed = 1.0
@export var min_zoom = 1
@export var max_zoom = 1
@export var margin = Vector2(200, 400)

@onready var other_player: CharacterBody2D = $"../../player2_firstLevel"

func _ready() -> void:
	if not other_player:
		print("Other player not found!")
	else:
		print("Other player found:", other_player.name)

func _process(delta: float) -> void:
	if not other_player:
		return

	# Calcula o ponto médio entre o jogador principal e o outro jogador
	var center_position = (get_parent().global_position + other_player.global_position) / 2

	# Suaviza o movimento da câmera em direção ao ponto médio
	global_position = lerp(global_position, center_position, move_speed * delta)

	# Calcula a área mínima para os dois jogadores ficarem visíveis
	var distance = get_parent().global_position.distance_to(other_player.global_position)
	var target_zoom = clamp(distance / margin.x, min_zoom, max_zoom)

	# Suaviza o zoom
	zoom = lerp(zoom, Vector2.ONE * target_zoom, zoom_speed * delta)
