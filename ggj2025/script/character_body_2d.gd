extends CharacterBody2D

var SPEED = 200

@onready var player = $".."
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	if Global.isInThreeD:
		self.visible = false
		self.set_process(false)
		SPEED = 0
	if Global.isInTwoD:
		self.visible = true
		self.set_process(true)
		SPEED = 200
		
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


func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.isInThreeD = true
	print("hola")
	Global.isInTwoD = false
