extends CharacterBody2D

const SPEED = 150

@onready var player = $".."
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	var input_dir = Input.get_vector("LEFT", "RIGHT", "TOP", "BOT")
	velocity = input_dir * SPEED

	# Determine animation based on movement direction
	if input_dir.y < 0:
		animation.play("top")
	if input_dir.y > 0:
		animation.play("bot")
	if input_dir.x < 0:
		animation.play("left")
	if input_dir.x > 0:
		animation.play("right")
	
	# Stop animation when no movement
	if input_dir == Vector2.ZERO:
		animation.stop()

	move_and_slide()
