extends Control

@export var level_scene: PackedScene = load("res://Scenes/level.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/Label2.text = $CenterContainer/VBoxContainer/Label2.text + str(Global.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
		
func _input(_event):
	if Input.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
