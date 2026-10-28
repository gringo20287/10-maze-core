extends CharacterBody2D
var speed = 170
@onready var anim = $AnimatedSprite2D
func _physics_process(_delta):
	var input = Vector2(Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'), Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up'))
	if input.x < 0:
		anim.flip_h = true
	elif input.x > 0:
		anim.flip_h = false
	if input != Vector2.ZERO:
		anim.play('walk')
	else:
		anim.play('idle')
	velocity = input.normalized() * speed
	move_and_slide()
