extends KinematicBody2D

const UP = Vector2(0, -1)
const SPEED = 100
var motion = Vector2()
var is_moving
#Função
func _physics_process(delta):

#Movimentação
 #Parado_meliante
	if is_moving:
		motion.x = 0
		motion.y = 0
		is_moving = false
 #Cima
	if Input.is_action_pressed("ui_up"):
		motion.y -= SPEED
		is_moving = true
 #Baixo
	elif Input.is_action_pressed("ui_down"):
		motion.y += SPEED
		is_moving = true
 #Direita
	if Input.is_action_pressed("ui_right"):
		motion.x += SPEED
		is_moving = true
 #Esquerda
	elif Input.is_action_pressed("ui_left"):
		motion.x -= SPEED
		is_moving = true

	motion = move_and_slide(motion, UP)
