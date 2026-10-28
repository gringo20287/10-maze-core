extends CharacterBody2D

@onready var player = get_parent().get_node('Player')
@export var anim: AnimatedSprite2D
@onready var game_over_scene = preload('res://lose.tscn')
	
func _physics_process(_delta):
	if not player:
		return

	var dir = (player.position - position).normalized()
	velocity = dir * 50
	move_and_slide()
	
	if velocity.x < 0:
		anim.flip_h = true
	elif velocity.x > 0:
		anim.flip_h = false

func _on_body_entered(body):
	if body.name == 'Player':
		get_tree().paused = true
		var game_over = game_over_scene.instantiate()
		get_tree().root.add_child(game_over)
