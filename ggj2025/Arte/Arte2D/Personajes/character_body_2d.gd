extends CharacterBody2D

var SPEED = 200

@onready var player = $".."
@onready var animation = $AnimatedSprite2D

func _physics_process(_delta):
	if Global.isTwoD == false && Global.isThreeD == true:
		self.queue_free()
		
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	if input_dir != Vector2.ZERO:
		animation.play("General_Sprite")


	move_and_slide()





func _on_area_2d_body_entered(body: Node2D) -> void:
	Global.isThreeD = true
	Global.isTwoD = false
	print("entro XD")


func _on_area_2d_body_entered_v2(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://Escenas/Nivel1/Tests/test_escena_0_1_3d_main.tscn")
