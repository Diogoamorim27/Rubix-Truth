extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var camera : Camera2D = $Camera2D

export var shake_strength : int = 3
# Called when the node enters the scene tree for the first time.
var stop_shake = false
func _ready():

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if !stop_shake:
			randomize()
#	pass


func _on_Timer_timeout():
	if !stop_shake:
		camera.offset = Vector2(sin(randi()),cos(randi())) * shake_strength


func _on_AudioStreamPlayer_finished():
	stop_shake = true
	camera.offset = Vector2()
	pass # Replace with function body.
