extends Node

var isThreeD : bool
var isTwoD : bool
var isMenu = true
var before = false
var vida = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isThreeD = false
	isTwoD = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
