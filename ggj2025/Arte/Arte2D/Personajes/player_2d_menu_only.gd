extends CharacterBody2D

var SPEED = 200

@onready var player = $".."
@onready var animation = $AnimatedSprite2D

func _physics_process(_delta):
	if Global.isMenu == false:
		self.queue_free()
		
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	if input_dir != Vector2.ZERO:
		animation.play("General_Sprite")


	move_and_slide()





func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.isMenu = false
	print("entro XD")
