extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MOVE_SPEED = 75
const GRAVITY = 9.8 * 20
const ACCEL = 20
const DEACCEL = 10
const JUMP = -100
const ROOM_ACCEL = 3

enum SceneChangeDir {LEFT, RIGHT, UP, DOWN}

var new_player_position : Vector2 = Vector2(128,128)
var movement : Vector2
var ComingFrom : int
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
