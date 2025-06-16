extends CharacterBody2D

const SPEED = 300.0
const ROTATION_SPEED = 3.0

@onready var polygon_2d: Polygon2D = $Polygon2D
@onready var collision_polygon: CollisionPolygon2D = $CollisionPolygon2D

# Access the actual joystick nodes inside the Control UI
@onready var move_joystick := $"../Control/movecontrole/Joystick"
@onready var rot_joystick := $"../Control/rotcontrole/Joystick"

func _ready() -> void:
	var triangle_points = [
		Vector2(0, -10),
		Vector2(10, 10),
		Vector2(-10, 10)
	]
	polygon_2d.polygon = triangle_points
	collision_polygon.polygon = triangle_points

func _physics_process(delta: float) -> void:
	# Movement
	var input_dir = move_joystick.get_normalized_vector()
	velocity = input_dir * SPEED
	move_and_slide()

	# Rotation
	var rot_dir = rot_joystick.get_normalized_vector()
	if rot_dir.length() > 0.1:
		var angle = rot_dir.angle()
		rotation = angle
