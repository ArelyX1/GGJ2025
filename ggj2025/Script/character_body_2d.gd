extends CharacterBody2D

const SPEED = 150

@onready var player = $".."
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	var input_dir = Input.get_vector("left", "right", "top", "bot")
	velocity = input_dir * SPEED

	# Determine animation based on movement direction
	if input_dir.y < 0:
		animation.play("TOP")
	if input_dir.y > 0:
		animation.play("BOT")
	if input_dir.x < 0:
		animation.play("LEFT")
	if input_dir.x > 0:
		animation.play("RIGHT")
	
	# Stop animation when no movement
	if input_dir == Vector2.ZERO:
		animation.stop()

	move_and_slide()
