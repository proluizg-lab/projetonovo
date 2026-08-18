extends CharacterBody2D

var input: Vector2 = Vector2.ZERO
var velocidade: float = 100.0


func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	input = input.normalized()


func character_movement():
	velocity = input * velocidade


func update_animation():
	if input.x > 0:
		$AnimatedSprite2D.play("direita")
	elif input.x < 0:
		$AnimatedSprite2D.play("esquerda")
	elif input.y > 0:
		$AnimatedSprite2D.play("baixo")
	elif input.y < 0:
		$AnimatedSprite2D.play("cima")
	else:
		$AnimatedSprite2D.stop()


func _ready() -> void:
	pass


func _physics_process(delta):
	get_input()
	character_movement()
	update_animation()
	move_and_slide()
