extends Node2D

onready var tilemap : TileMap = $TileMap
onready var player : KinematicBody2D = $Player
onready var entrance_area : Area2D = $TileMap/Entrance/Area2D
onready var entrance_text : Label = $TileMap/Entrance/Area2D/Label


export var room_on_the_left = ""
export var room_on_the_right = ""
export var room_above = ""
export var room_below = ""
export var MOVE_SPEED = 50
export var GRAVITY = 9.8 * 20
export var ACCEL = 20
export var DEACCEL = 10
export var JUMP = -100
export var ROOM_ACCEL = 3
export var gate_to = PI/2

var balance = 0
var movement : = Vector2()
var room_target = 0
var gate_direction = Vector2()
var room_rotation

# Called when the node enters the scene tree for the first time.
func _ready():
	movement = PlayerVariables.movement
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
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

	## PORTAL LOGIC ##

	movement = player.move_and_slide(movement, Vector2.UP)


	## ROOM ROTATION ##
	if Input.is_action_just_pressed("q"): # and rotation_active:
		room_target -= 90

	elif Input.is_action_just_pressed("e"): # and is_current_room and rotation_active:
		room_target += 90

	tilemap.rotation_degrees = lerp(tilemap.rotation_degrees, room_target, ROOM_ACCEL*delta)
	
	
#	room_rotation = Vector2(cos(room_target),sin(room_target)) + Vector2(-1,1)
	
	## TEXT DISPLAY ##
	if entrance_area.overlaps_body(player):
		entrance_text.visible = true
	else:
		entrance_text.visible = false
	
	gate_direction = Vector2(round(cos(deg2rad(room_target))),round(sin(deg2rad(room_target))))
#	print(gate_direction)
#	print(gate_direction)

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


func _on_Gate_body_entered(body):
	if body.name == "Player":
		PlayerVariables.movement = movement
		print (gate_direction)
		print(Vector2.DOWN)
		match gate_direction:
			Vector2.DOWN:
				print("down")
				print(PlayerVariables.new_player_position)
				get_tree().change_scene(room_below)
			Vector2.RIGHT:
				print("right")
				get_tree().change_scene(room_on_the_right)
			Vector2.UP:
				print("oa")
			Vector2.LEFT:
				print("oi")
			_:
				print("nada")

