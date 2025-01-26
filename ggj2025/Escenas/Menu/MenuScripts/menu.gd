extends Control


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Nivel1/3D/escena_0_1_3d_main.tscn")


func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Opciones/Opciones.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
