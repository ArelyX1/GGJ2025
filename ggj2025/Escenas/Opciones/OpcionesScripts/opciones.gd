extends Control


func _on_sonido_pressed() -> void:
	pass 


func _on_resolucion_pressed() -> void:
	pass


func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Menu/menu.tscn")
