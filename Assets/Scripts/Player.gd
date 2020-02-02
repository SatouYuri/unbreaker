extends KinematicBody2D

var velocity = Vector2()
var moveSpeed = 200
var direction = "down" #DEFAULT: "down"

func is_moving():
	if !Input.is_action_pressed("ui_up")\
	and !Input.is_action_pressed("ui_down")\
	and !Input.is_action_pressed("ui_right")\
	and !Input.is_action_pressed("ui_left"):
		return false;
	return true
	
func playAnim(anim):
	match anim:
		"Idle":
			match direction:
				"down":
					$UpperBody.play("idle_down")
					$LowerBody.play("idle_down")
					$LeftHand.play("idle_down")
					$RightHand.play("idle_down")
				"up":
					$UpperBody.play("idle_up")
					$LowerBody.play("idle_up")
					$LeftHand.play("idle_up")
					$RightHand.play("idle_up")
				"left":
					$UpperBody.play("idle_left")
					$LowerBody.play("idle_left")
					$LeftHand.play("idle_left")
					$RightHand.play("idle_left")
				"right":
					$UpperBody.play("idle_right")
					$LowerBody.play("idle_right")
					$LeftHand.play("idle_right")
					$RightHand.play("idle_right")
		"Walk":
			match direction:
				"down":
					$UpperBody.play("walk_down")
					$LowerBody.play("walk_down")
					$LeftHand.play("walk_down")
					$RightHand.play("walk_down")
				"up":
					$UpperBody.play("walk_up")
					$LowerBody.play("walk_up")
					$LeftHand.play("walk_up")
					$RightHand.play("walk_up")
				"left":
					$UpperBody.play("walk_left")
					$LowerBody.play("walk_left")
					$LeftHand.play("walk_left")
					$RightHand.play("walk_left")
				"right":
					$UpperBody.play("walk_right")
					$LowerBody.play("walk_right")
					$LeftHand.play("walk_right")
					$RightHand.play("walk_right")

func _physics_process(delta):
	#Movimentação: Eixo X
	if Input.is_action_pressed("ui_right"):
		velocity.x = moveSpeed
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -moveSpeed
	
	#Movimentação: Eixo Y
	if Input.is_action_pressed("ui_up"):
		velocity.y = -moveSpeed
		
	if Input.is_action_pressed("ui_down"):
		velocity.y = moveSpeed
		
	#Evitando problemas de controle com o vetor velocidade
	if Input.is_action_just_released("ui_right") || Input.is_action_just_released("ui_left"):
		velocity.x = 0
		
	if Input.is_action_just_released("ui_up") || Input.is_action_just_released("ui_down"):
		velocity.y = 0
	
	#Direção:
	if velocity.x > 0: #RIGHT
		direction = "right"
	elif velocity.x < 0: #LEFT
		direction = "left"
	elif velocity.y < 0: #UP
		direction = "up"
	elif velocity.y > 0: #DOWN
		direction = "down"
		
	#Zerando a velocidade (Fim do Frame)
	if !is_moving():
		velocity = Vector2(0, 0)
		playAnim("Idle")
	else:
		playAnim("Walk")
		
	move_and_slide(velocity)