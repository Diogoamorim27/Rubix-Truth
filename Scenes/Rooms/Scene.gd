extends Node2D

onready var tilemap : TileMap = $TileMap
onready var player : KinematicBody2D = $Player
onready var portal_1 : Area2D = $TileMap/Portal1
onready var portal_2 : Area2D = $TileMap/Portal2


export var MOVE_SPEED = 50
export var GRAVITY = 9.8 * 20
export var ACCEL = 20
export var DEACCEL = 10
export var JUMP = -100
export var ROOM_ACCEL = 3

var balance = 0
var movement : = Vector2()
var room_target = 0
var entered_portal_1 : = false
var entered_portal_2 : = false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	print (player.global_position)
	## CHARACTER MOVEMENT ##
	var input = _directional_input()

	if player.is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		movement.y = JUMP
	else:
		movement.y += GRAVITY * delta

	var temp_movement = movement
	temp_movement.y = 0
	var target = input * MOVE_SPEED
	var acceleration

	if input * temp_movement.x > 0:
		acceleration = ACCEL
	else:
		acceleration = DEACCEL

	temp_movement = lerp(temp_movement, Vector2(target, 0), acceleration*delta)
	movement.x = temp_movement.x

		## PORTAL MOVEMENT ##
	if entered_portal_1:
		player.global_position = portal_2.global_position
		print(movement)
		if (portal_1.rotation != portal_2.rotation):
			movement = movement.rotated(portal_1.rotation - portal_2.rotation)
		elif portal_1.rotation == abs(90):
			movement = Vector2(-movement.x,movement.y)
		else:
			movement = Vector2(movement.x,-movement.y)
		entered_portal_1 = false
	elif entered_portal_2:
		player.global_position = portal_1.global_position
		movement = movement.rotated(portal_2.rotation - portal_1.rotation)
		print(movement)
		#movement = movement.rotated(-PI/2)
		entered_portal_2 = false


	movement = player.move_and_slide(movement, Vector2.UP)


	## ROOM ROTATION ##
	if Input.is_action_just_pressed("q"): # and rotation_active:
		room_target -= 90

	elif Input.is_action_just_pressed("e"): # and is_current_room and rotation_active:
		room_target += 90

	tilemap.rotation_degrees = lerp(tilemap.rotation_degrees, room_target, ROOM_ACCEL*delta)



func _directional_input() -> int:
	if !(Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")):
		balance = 0
		return 0

	if Input.is_action_pressed("ui_right") and !Input.is_action_pressed("ui_left"):
		balance = 1
		return 1

	if !Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		balance = -1
		return -1

	if balance == 1 and Input.is_action_pressed("ui_left"):
		return -1

	if balance == -1 and Input.is_action_pressed("ui_right"):
		return 1

	return 0


func _on_Portal1_body_entered(body):
	if body.name == "Player":
		entered_portal_1 = true
		print("hi")
	pass # Replace with function body.


func _on_Portal2_body_entered(body):
	if body.name == "Player":
		entered_portal_2 = true
	pass # Replace with function body.
