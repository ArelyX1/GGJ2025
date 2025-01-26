extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if Enter key is pressed
	if Input.is_action_just_pressed("enter"):
		# Change scene to another scene
		get_tree().change_scene_to_file("res://Escenas/Nivel1/2D/Escena_0_2d_main.tscn")
