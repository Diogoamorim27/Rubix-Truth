extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var next_scene : String
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_Gate_body_entered(body):
	if body.name == "Player":
		print("player here")
		get_tree().change_scene(next_scene)
	pass # Replace with function body.
