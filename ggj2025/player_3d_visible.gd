extends Node3D




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace w	ith function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_portal_3d_body_entered(body: Node3D) -> void:
	Global.isInThreeD = false
	Global.isInTwoD = true
	
