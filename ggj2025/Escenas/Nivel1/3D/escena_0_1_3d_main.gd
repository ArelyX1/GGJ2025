extends Node3D

var camera1: Camera3D
var camera2: Camera3D
var transition_duration = 1.0
var transition_timer = 0.0
var transitioning = false
var target_node: Node3D
var current_camera: Camera3D


func _process(delta):
	
	if transitioning:
		transition_timer += delta
		var t = ease(transition_timer / transition_duration, 2.0) # Aplica una función de interpolación suave a t

		var current_camera_transform = current_camera.global_transform
		var target_camera_transform = target_node.global_transform
		var interpolated_transform = current_camera_transform.interpolate_with(target_camera_transform, t)
		current_camera.global_transform = interpolated_transform

		if t >= 1.0:
			transitioning = false
			transition_timer = 0.0


func start_camera_transition(to_camera: Camera3D, target: Node3D):
	transitioning = true
	camera1 = get_node("camera_2d") 
	camera2 = get_node("JUGADOR/CameraArm2/main_cam_player") 
	camera1.current = false
	camera2.current = false
	to_camera.current = true
	current_camera = to_camera
	current_camera.global_transform = camera1.global_transform
	target_node = target
  
 
# donde dice "CameraPlayer" es a la camara que deseas cambiar y el "p1" es el punto o nodo vacio en el mapa donde se colocara
#get_parent().start_camera_transition(get_parent().get_node("CameraPlayer"), get_parent().get_node("p1"))
