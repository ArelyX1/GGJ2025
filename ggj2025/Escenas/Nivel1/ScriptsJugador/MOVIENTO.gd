extends CharacterBody3D

const mouse_sensitivity_horizontal = 0.1
const mouse_sensitivity_vertical = 0.1

var SPEED = 6.0
const JUMP_FORCE = 10
const GRAVITY = -30.0
const JUMP_TIME = 1

const MIN_CAMERA_DISTANCE = 0.0001
const MAX_CAMERA_DISTANCE = 1.0

var jump_timer = 0.0
var is_jumping = false
var current_camera_distance = 0.0001


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	# Ajustamos la posición inicial de la cámara en -current_camera_distance
	$CameraArm.position.z = current_camera_distance
	SPEED = 0
	self.visible = false


func _physics_process(delta: float) -> void:
	if Global.isMenu == false && Global.before == false:
		self.visible = true
		SPEED = 5.0
		Global.before = true
		get_parent().start_camera_transition(get_parent().get_node("JUGADOR/CameraArm2/main_cam_player"), get_parent().get_node("JUGADOR/CameraArm2/PP1"))
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_FORCE
		jump_timer = JUMP_TIME
		is_jumping = true

	if is_jumping:
		jump_timer -= delta
		if jump_timer <= 0.0:
			is_jumping = false

	if not is_on_floor() and not is_jumping:
		velocity.y += GRAVITY * delta

	var input_dir := Input.get_vector("3d_left", "3d_right", "down", "up")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity.x = direction.x * SPEED
	velocity.z = direction.z * SPEED
	move_and_slide()

func _input(event):
	
	if event is InputEventMouseMotion:
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			rotate_y(deg_to_rad(event.relative.x * mouse_sensitivity_horizontal))
			$CameraArm.rotate_x(deg_to_rad(event.relative.y * mouse_sensitivity_vertical))
			$CameraArm.rotation.x = clamp($CameraArm.rotation.x, deg_to_rad(-98.0), deg_to_rad(30.0))

	# Detectar scroll del ratón
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			current_camera_distance = max(current_camera_distance - 1, MIN_CAMERA_DISTANCE)
			$CameraArm.position.z = -current_camera_distance
		elif event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			current_camera_distance = min(current_camera_distance + 1, MAX_CAMERA_DISTANCE)
			$CameraArm.position.z = -current_camera_distance
