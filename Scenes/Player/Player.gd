extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var raycast : = $RayCast2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func can_jump():
	if raycast.is_colliding():
		print("im colliding")
		print(raycast.get_collider())
		return true
##	pass
