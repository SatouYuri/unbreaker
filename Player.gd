extends KinematicBody2D

const UP = Vector2(0, -1)
const SPEED = 350
var motion = Vector2()
var direction = "down"

#Função
func is_moving():
	if Input.is_action_pressed("ui_up")\
	or Input.is_action_pressed("ui_down")\
	or Input.is_action_pressed("ui_right")\
	or Input.is_action_pressed("ui_left"):
		return true;
	return false

func play_body(animation):
	match animation:
		_:
			$UpperBody.play(animation)
			$LowerBody.play(animation)
			$LeftHand.play(animation)
			$RightHand.play(animation)
	"""
	$FEATHER.play(animation)
	"""

func _physics_process(_delta):
#Movimentação
	#Cima
	if Input.is_action_pressed("ui_up"):
		motion.y -= SPEED
		direction = "up"
	#Baixo
	elif Input.is_action_pressed("ui_down"):
		motion.y += SPEED
		direction = "down"
	#Esquerda
	if Input.is_action_pressed("ui_left"):
		motion.x -= SPEED
		direction = "left"
	#Direita
	elif Input.is_action_pressed("ui_right"):
		motion.x += SPEED
		direction = "right"
	#Mexe desgraça
	if is_moving():
		play_body("walk_" + direction)
	else:
		play_body("idle_" + direction)

	motion = move_and_slide(motion, UP)
	#Parado_meliante
	motion.x = 0
	motion.y = 0
