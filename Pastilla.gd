extends Area2D

var esPastillaB = true
var PastillaT = "B"
var speed := 1.0
var aux = 0
var i = 0
var orden = ["B", "V", "R"]

func _ready():
	aux = randi() % 10 + 1
	if aux < 2:
		$Sprite.texture = preload("res://Bpill.png")
		PastillaT = "M"
	elif aux > 2 and aux < 5:
		$Sprite.texture = preload("res://Bpill Verde.png")
		PastillaT = "V"
	elif aux > 5 and aux < 8:
		$Sprite.texture = preload("res://Bpill Roja.png")
		PastillaT = "R"
	elif aux > 8 and aux < 9:
		$Sprite.texture = preload("res://Bpill.png")

func _on_body_entered(body):
	if body.is_in_group("Player"):
		if PastillaT == orden[Global.i]:
			if orden[Global.i] == "B":
				Global.i = 1
			elif orden[Global.i] == "V":
				Global.i = 2
			elif orden[Global.i] == "R":
				Global.i = 0
			print(orden[Global.i])
			body.subirScore()
			queue_free()
		else:
			print("Wrong pill color!")
			body.morir()

func _process(delta):
	position.y += speed
