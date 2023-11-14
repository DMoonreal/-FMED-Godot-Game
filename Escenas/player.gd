extends CharacterBody2D

var speed = 100
signal scoreUP
signal PlayerDied
func _physics_process(delta):
	var inputVel = Input.get_axis("ui_left","ui_right")
	var salto = Input.get_action_strength("saltar")
	velocity.x = inputVel * speed
	
	if salto != 0 and is_on_floor():
		velocity.y = 0
		velocity.y -= salto * 200
	if !is_on_floor():
		velocity.y+=10
	move_and_slide()
	if velocity.x != 0 :
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")	 
	if velocity.x != 0:
		$AnimatedSprite2D.flip_h = inputVel < 0
func subirScore():
	$Bien.play()
	emit_signal("scoreUP")
func morir():
	$Morir.play()
	$AnimatedSprite2D.play("hurt")
	emit_signal("PlayerDied")
	
	
