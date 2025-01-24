extends Control


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/juego_de_pruba.tscn")

func _on_opciones_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/opciones.tscn")
	pass 

func _on_salir_pressed() -> void:
	get_tree().quit()
