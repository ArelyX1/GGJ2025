extends CharacterBody3D

var val_vel = 10

func _procces(delta):
	velocity = Vector3(0,0,val_vel)
	move_and_slide()
	pass
