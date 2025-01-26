extends CanvasLayer


var points = 0

func _ready() -> void:
	$score.text = "Score: " + str(points)


func _on_coin_body_entered(body: Node2D) -> void:
	points += 1 
	$score.text = "Score: " + str(points)
