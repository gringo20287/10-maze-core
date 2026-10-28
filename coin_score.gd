extends Node2D

@onready var coin_score = get_parent().get_node('CoinScore')

func _on_body_entered(body):
	if body.name == 'Player':
		coin_score.coin_plus()
		queue_free()
