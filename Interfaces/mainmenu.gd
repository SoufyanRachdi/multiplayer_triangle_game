extends CanvasLayer

@onready var panel: Panel = $Panel

@onready var begin_button: Button = $Panel/VBoxContainer/BeginButton

func _ready():
	panel.process_mode = Node.PROCESS_MODE_ALWAYS  # Updated to correct enumget_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
	begin_button.pressed.connect(_on_begin_pressed)
	
func _on_begin_pressed():
	print("Begin pressed")
	print("hello")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")
