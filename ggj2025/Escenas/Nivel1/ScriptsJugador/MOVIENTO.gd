extends CharacterBody3D

const mouse_sensitivity_horizontal = 0.1
const mouse_sensitivity_vertical = 0.1

const SPEED = 1
const JUMP_VELOCITY = 0.2
const MIN_GRAVITY = -1.2
const MAX_GRAVITY = -0.6
const CUSTOM_GRAVITY_CHANGE_TIME = 5.0
const MAX_ASCENT_FORCE = 0.06
const ASCENT_DECAY = 0.1

var ascent_force = 0.0
var current_gravity = -0.7
var gravity_change_timer = 0.0

func _ready():
	gravity_change_timer = CUSTOM_GRAVITY_CHANGE_TIME
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	gravity_change_timer -= delta
	if gravity_change_timer <= 0:
		current_gravity = randf_range(MIN_GRAVITY, MAX_GRAVITY)
		gravity_change_timer = CUSTOM_GRAVITY_CHANGE_TIME

	if not is_on_floor():
		velocity.y += current_gravity * delta

	if Input.is_action_pressed("ui_accept"):
		ascent_force = min(ascent_force + JUMP_VELOCITY * delta, MAX_ASCENT_FORCE)
	else:
		ascent_force = max(ascent_force - ASCENT_DECAY * delta, 0)

	velocity.y += ascent_force
	
	var input_dir := Input.get_vector("left", "right", "down", "up")
	var direction := (transform.basis * Vector3(input_dir.x,0,	input_dir.y)).normalized()

	# Mover al personaje sin tener en cuenta la rotación de la cámara
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED

	move_and_slide()

func _input(event):
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			rotate_y(deg_to_rad(-event.relative.x * mouse_sensitivity_horizontal))
			$CameraArm.rotate_x( - deg_to_rad(event.relative.y * mouse_sensitivity_vertical))
			$CameraArm.rotation.x = clamp($CameraArm.rotation.x, deg_to_rad(-98.0), deg_to_rad(30.0))
			
