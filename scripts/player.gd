extends CharacterBody2D

const SPEED = 300.0
const ROTATION_SPEED = 3.0

@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon: CollisionPolygon2D = $CollisionPolygon2D

func _ready() -> void:
	var triangle_points = [
		Vector2(0, -10),
		Vector2(10, 10),
		Vector2(-10, 10)
	]
	polygon_2d.polygon = triangle_points
	collision_polygon.polygon = triangle_points

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
