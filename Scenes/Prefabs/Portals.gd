extends Node2D

onready var portal1 : Area2D = $Portal1
onready var portal2 : Area2D = $Portal2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var entered_portal : = false
var new_position : = Vector2()
var movement_rotation : = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Portal1_body_entered(body):
	if body.name == "Player": 
		entered_portal = true
		new_position = portal2.global_position
		movement_rotation = portal1.rotation - portal2.rotation
	pass # Replace with function body.


func _on_Portal2_body_entered(body):
	if body.name == "Player":
		entered_portal = true
		new_position = portal1.global_position
		movement_rotation = portal2.rotation - portal1.rotation
	pass # Replace with function body.
