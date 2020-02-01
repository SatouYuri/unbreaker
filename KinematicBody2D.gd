extends KinematicBody2D

const UP = Vector2(0, -1)
const SPEED = 350
var motion = Vector2()
#Função
func is_moving():
	if Input.is_action_pressed("ui_up")\
	or Input.is_action_pressed("ui_down")\
	or Input.is_action_pressed("ui_right")\
	or Input.is_action_pressed("ui_left"):
		return true;
	return false;
func _physics_process(delta):
#Movimentação
	if not is_moving():
		$Sprite.play("idle")
	#Cima
	if Input.is_action_pressed("ui_up"):
		motion.y -= SPEED
		$Sprite.play("walk")
	#Baixo
	elif Input.is_action_pressed("ui_down"):
		motion.y += SPEED
		$Sprite.play("walk")
	#Direita
	if Input.is_action_pressed("ui_right"):
		motion.x += SPEED
		$Sprite.play("walk")
	#Esquerda
	elif Input.is_action_pressed("ui_left"):
		motion.x -= SPEED
		$Sprite.play("walk")
	#Mexe desgraça
	motion = move_and_slide(motion, UP)
	#Parado_meliante
	motion.x = 0
	motion.y = 0
