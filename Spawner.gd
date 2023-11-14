extends Node2D

var pastilla = preload("res://Escenas/pastilla.tscn")

var dificultad = 0

func _ready():
	$Timer.wait_time = randf_range(1.1,3)

func _on_timer_timeout():
	dificultad = .01
	if $Timer.wait_time > 0.5:
		$Timer.wait_time -=.01
	var coleccionable = pastilla.instantiate()
	coleccionable.speed += dificultad
	add_child(coleccionable)
	
