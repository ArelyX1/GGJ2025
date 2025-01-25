extends CharacterBody2D

var SPEED = 200

@onready var player = $"."
@onready var animation = $AnimatedSprite2D

func _physics_process(delta):
	if Global.isTwoD == false && Global.isThreeD == true:
		self.visible = false
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED

	# Determine animation based on movement direction
	if input_dir.y < 0 || input_dir.y > 0 || input_dir.x > 0 || input_dir.x < 0:
		animation.play("General_Sprite")
	
	# Stop animation when no movement
	if input_dir == Vector2.ZERO:
		# animation.stop()
		animation.play("General_Sprite")

	move_and_slide()


func _on_portal_2d_body_entered(body: Node2D) -> void:
	Global.isThreeD = true
	Global.isTwoD = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.isThreeD = true
	Global.isTwoD = false
	print("entro XD")
