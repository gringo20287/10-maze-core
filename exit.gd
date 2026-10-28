extends Area2D

@onready var game_over_scene = preload('res://win.tscn')

func _on_body_entered(body):
	if body.name == 'Player':
		get_tree().paused = true
		var game_over = game_over_scene.instantiate()
		get_tree().root.add_child(game_over)
