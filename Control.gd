extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var button : = $TextureButton
onready var camera : = $Camera2D
onready var audio_player : = $AudioStreamPlayer
onready var particles : = $Particles2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button.is_hovered():
		if !audio_player.playing:
			audio_player.play(0)
		camera.offset = Vector2(sin(randi()),cos(randi())) * 1
		particles.emitting = true
		randomize()	
	else: 
		camera.offset = Vector2()
	


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Rooms/Intro.tscn")
	pass # Replace with function body.
