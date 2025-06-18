extends CanvasLayer

@onready var panel: Panel = $Panel

@onready var playinserver: Button = $Panel/VBoxContainer/playinserver
@onready var rankedmode: Button = $Panel/VBoxContainer/rankedmode

func _ready():
	panel.process_mode = Node.PROCESS_MODE_ALWAYS  # Updated to correct enumget_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	rankedmode.pressed.connect(_on_begin_pressed)
	playinserver.pressed.connect(_on_playinserver_pressed)
func _on_begin_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main.tscn")
func _on_playinserver_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Interfaces/playinserver/playinserver.tscn")
	pass
