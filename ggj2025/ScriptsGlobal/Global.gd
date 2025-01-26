extends Node

var isThreeD : bool
var isTwoD : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isThreeD = false
	isTwoD = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
