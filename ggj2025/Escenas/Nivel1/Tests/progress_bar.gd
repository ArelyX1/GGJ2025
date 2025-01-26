extends ProgressBar


var max : int

func _ready() -> void:
	max = 3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func disminuir(damage):
	value -= damage
