extends AnimatedSprite2D

@onready var manager: Manager = get_node_or_null("/root/Game/Manager")	
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
	
func _on_coin_body_entered(body):
	manager.pointss()
	animation_player.play("Animation")
