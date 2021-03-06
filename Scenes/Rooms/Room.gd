extends Node2D

onready var tilemap : TileMap = $TileMap
onready var player : KinematicBody2D = $Player
onready var gate : Area2D = $TileMap/Gate
onready var gates : Node = $TileMap/Gates
onready var player_animator : AnimationPlayer = $Player/AnimationPlayer

## ADJACENT ROOMS ##
export var room_on_the_left = "scene_uninitialized"
export var room_on_the_right = "scene_uninitialized"
export var room_above = "scene_uninitialized"
export var room_below = "scene_uninitialized"
export var room_index : int

var balance = 0
var movement : = Vector2()
var room_target = 0
var gate_direction = Vector2()
var room_rotation
var has_portals : bool 
var portals : Area2D
var last_gate_direction = Vector2()
var is_dying : = false
# Called when the node enters the scene tree for the first time.
func _ready():
	## chekcing if singleton works


	
	## CHECK FOR PORTALS ##
	
	for child in tilemap.get_children():
		if child.name == "Portals":
			portals = $TileMap/Portals
			has_portals = true
			
	## INITIALIZE PLAYER VARIABLES
	
#	player.global_position = PlayerVariables.new_player_position
	movement = PlayerVariables.movement
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	## DEBUG ##


	## CHARACTER MOVEMENT ##
	var input = _directional_input()
	
	## JUMP / APPLY GRAVITY ##
	if player.can_jump():
		movement.y = 0
		if Input.is_action_pressed("ui_accept"):
			movement.y = PlayerVariables.JUMP
	else:
		movement.y += PlayerVariables.GRAVITY * delta

	## HORIZONTAL MOVEMENT ##
	var temp_movement = movement
	temp_movement.y = 0
	var target = input * PlayerVariables.MOVE_SPEED
	var acceleration

	if input * temp_movement.x > 0:
		acceleration = PlayerVariables.ACCEL
	else:
		acceleration = PlayerVariables.DEACCEL



	temp_movement = lerp(temp_movement, Vector2(target, 0), acceleration*delta)
	movement.x = temp_movement.x

	## PORTAL LOGIC ##
	if has_portals:
		if portals.entered_portal == true:
			player.global_position = portals.new_position
			movement = movement.rotated(portals.movement_rotation)
			portals.entered_portal = false

	

	movement = player.move_and_slide(movement, Vector2.UP)


	## ROOM ROTATION ##
	if Input.is_action_just_pressed("q"): # and rotation_active:
		room_target -= 90

	elif Input.is_action_just_pressed("e"): # and is_current_room and rotation_active:
		room_target += 90

	tilemap.rotation_degrees = lerp(tilemap.rotation_degrees, room_target, PlayerVariables.ROOM_ACCEL*delta)
	
	## NEXT ROOM DECIDER ##
	last_gate_direction = gate_direction
	gate_direction = Vector2(round(cos(deg2rad(room_target))),round(sin(deg2rad(room_target))))

	## HANDLE ANIMATION #
	
	
	## GATE STATE LOGIC##
	
	if last_gate_direction != gate_direction:
		for gate in gates.get_children():
			match gate_direction:
				Vector2.DOWN:
					if ResourceLoader.exists(room_below):
						gate.locked.disabled = true
					else: 
						gate.locked.disabled = false
				Vector2.UP:
					if ResourceLoader.exists(room_above):
						gate.locked.disabled = true
					else: 
						gate.locked.disabled = false
				Vector2.LEFT:
					if ResourceLoader.exists(room_on_the_left):
						gate.locked.disabled = true
					else: 
						gate.locked.disabled = false
				Vector2.RIGHT:
					if ResourceLoader.exists(room_on_the_right):
						gate.locked.disabled = true
					else: 
						gate.locked.disabled = false

#func _animation_handler() -> void:
#	match player_animator.current_animation:
#		_: 
#			pass

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
		match gate_direction:
			Vector2.DOWN:
				if ResourceLoader.exists(room_below):
					PlayerVariables.ComingFrom = PlayerVariables.UP
					get_tree().change_scene(room_below)
					PlayerVariables.new_player_position = Vector2(player.global_position.x, player.global_position.y + 256)
				else:
					print("Scene ", room_below ," doesnt exist")
			Vector2.RIGHT:
				if ResourceLoader.exists(room_on_the_right):
					PlayerVariables.ComingFrom = PlayerVariables.LEFT
					PlayerVariables.new_player_position = Vector2(player.global_position.x - 256, player.global_position.y)
					get_tree().change_scene(room_on_the_right)
				else:
					print("Scene ", room_on_the_right ," doesnt exist")
			Vector2.UP:
				if ResourceLoader.exists(room_above):
					PlayerVariables.ComingFrom = PlayerVariables.DOWN
					PlayerVariables.new_player_position = Vector2(player.global_position.x, player.global_position.y - 256)
					get_tree().change_scene(room_above)
				else:
					print("Scene ", room_above ," doesnt exist")
			Vector2.LEFT:
				if ResourceLoader.exists(room_on_the_left): 
					PlayerVariables.ComingFrom = PlayerVariables.RIGHT
					PlayerVariables.new_player_position = Vector2(player.global_position.x + 256, player.global_position.y)
					get_tree().change_scene(room_on_the_left)
				else:
					print("Scene ", room_on_the_left ," doesnt exist")
			_:
				print("Gate direction invalid")



func _on_Area2D_body_entered(body):
	if body.name == "Player":
		is_dying = true
	pass # Replace with function body.
