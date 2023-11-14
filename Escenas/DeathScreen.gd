extends CanvasLayer



func _on_salir_pressed():
	get_tree().quit()


func _on_reiniciar_pressed():
	Global.i = 0
	get_tree().paused=false
	get_tree().reload_current_scene() # Replace with function body.
