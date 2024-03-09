extends CharacterBody2D

@export var speed = 30.0

var gravity = 200.0
var direction = 1.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _ready() -> void :
	animated_sprite_2d.play("Idle")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if is_on_floor():
		if is_on_wall():
			turn_around()
	
	velocity.x = direction * speed
	animated_sprite_2d.scale.x = direction

	move_and_slide()

func turn_around() -> void:
	direction *= -1.0
