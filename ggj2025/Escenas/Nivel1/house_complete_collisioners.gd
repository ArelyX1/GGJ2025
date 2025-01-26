extends Node3D

func _ready():
	# Encuentra StaticBody3D y crea las áreas
	var static_body = $StaticBody3D
	if not static_body:
		print("Error: StaticBody3D no encontrado.")
		return

	for child in static_body.get_children():
		if child is CollisionShape3D:
			# Crear un nuevo Area3D y CollisionShape3D
			var area = Area3D.new()
			add_child(area)
			var new_collision_shape = CollisionShape3D.new()
			area.add_child(new_collision_shape)
			
			# Configurar el CollisionShape
			new_collision_shape.shape = child.shape
			
			# Posicionar el Area3D y el CollisionShape3D exactamente como el original
			area.global_transform = child.global_transform
