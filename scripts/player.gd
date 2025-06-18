extends CharacterBody2D

@onready var SPEED = 300.0
@onready var ROTATION_SPEED = 3.0
@onready var max_health =100
@onready var health =100
func _ready() -> void:
	health=max_health

func _physics_process(delta: float) -> void:
	# Movement (ZQSD)
	var input_dir := Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * SPEED
	move_and_slide()

	# Rotation (Q and D or A and E, or your choice)
	if Input.is_action_pressed("rot_left"):
		rotation -= ROTATION_SPEED * delta
	elif Input.is_action_pressed("rot_right"):
		rotation += ROTATION_SPEED * delta

func die() :
	queue_free()
func _on_attackzone_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		body.die
	pass # Replace with function body.
func _enter_tree() -> void:
	set_multiplayer_authority(name.to_int())
	
