extends Area2D

var damage = 20
var speedDebuff = 0.8
var orientation = "down"
var hitSpeed = 0
var lastSide = "right"

func getDirection(): #Atualiza a variável orientation com base na direção do usuário (Player/Enemies/etc)
	return get_parent().get_parent().direction
	
func _physics_process(delta):
	#Orientação da arma
	orientation = getDirection()
	match orientation:
		"up":
			if get_parent().position.x < 0:
				get_parent().position.x *= -1
				get_parent().rotation_degrees *= -1
				get_parent().z_index = 9
		"down":
			if get_parent().position.x > 0:
				get_parent().position.x *= -1
				get_parent().rotation_degrees *= -1
				get_parent().z_index = 11
				
		#"left"
		
		#"right"