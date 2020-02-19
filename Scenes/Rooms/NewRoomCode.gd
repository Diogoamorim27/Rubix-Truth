extends Node2D

onready var tilemap : TileMap = $TileMap
onready var player : KinematicBody2D = $Player
onready var gate : = $TileMap/Gate
onready var player_animator : AnimationPlayer = $Player/AnimationPlayer
onready var player_sprite : = $Player/Sprite
onready var screen_shake : = $ScreenShake
onready var shake_audio_player : = $ScreenShake/AudioStreamPlayer
onready var shake_particles : = $ScreenShake/Particles2D

## ADJACENT ROOMS ##
export var next_scene : = ""

var balance = 0
var movement : = Vector2()
var room_target = 0
var gate_direction = Vector2()
var room_rotation
var has_portals : bool 
var portals 
var last_gate_direction = Vector2()

var is_dying : = false

## STATE VARS ##
var idle : = "idle"
var die : = "die"
var jump : = "jump"
var run : = "run"

var state : = idle
# Called when the node enters the scene tree for the first time.
func _ready():	## CHECK FOR PORTALS ##
	## new ver ##
	gate.locked.disabled = true
	
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

	## NEW STATE LOGIC ##
	match state:
		idle:
			_apply_movement(0, delta)
			player_animator.play("idle")
			if is_dying:
				state = die
			elif player.can_jump():
				if Input.is_action_pressed("ui_accept"):
					movement.y = PlayerVariables.JUMP
					state = jump
				else:
					if _directional_input():
						state = run
			else:
				state = jump
		die: 
			_apply_movement(0, delta)
			_apply_gravity(delta)
			gate.locked.disabled = false
			if player_animator.current_animation != "die":
				player_animator.play("die")
				
		run:
			if player_animator.current_animation != "running":
				player_animator.play("running")
			if player.can_jump():
				var input = _directional_input()
				if !input:
					state = idle
				else:
					_apply_movement(input, delta)
				
				if Input.is_action_pressed("ui_accept"):
					movement.y = PlayerVariables.JUMP
					state = jump
			else: 
				state = jump
			
		jump:
			if player_animator.current_animation != "jump":
				player_animator.play("jump")
			var input = _directional_input()
			_apply_movement(input, delta)
			_apply_gravity(delta)
			
			if player.can_jump():
				state = idle
			
			pass
			
		

	if state != die and state != idle:
		if movement.x < 0.1:
			player_sprite.flip_h = true
		else:
			player_sprite.flip_h = false


	## PORTAL LOGIC ##
	if has_portals:
		if portals.entered_portal == true:
			player.global_position = portals.new_position
			movement = movement.rotated(portals.movement_rotation)
			portals.entered_portal = false

	

	movement = player.move_and_slide(movement, Vector2.UP)


	## ROOM ROTATION ##
	if state != die:
		if Input.is_action_just_pressed("q"): # and rotation_active:
			room_target -= 90
			_screen_shake()
	
		elif Input.is_action_just_pressed("e"): # and is_current_room and rotation_active:
			room_target += 90
			_screen_shake()

	tilemap.rotation_degrees = lerp(tilemap.rotation_degrees, room_target, PlayerVariables.ROOM_ACCEL*delta)
	
	## NEXT ROOM DECIDER ##
	last_gate_direction = gate_direction
	
	gate_direction = Vector2(round(cos(deg2rad(room_target))),round(sin(deg2rad(room_target))))

	## HANDLE ANIMATION #
	
	
	## GATE STATE LOGIC##
	

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
	if body.name == "Player" and state!= die:
		get_tree().change_scene(next_scene)


func _apply_movement(input, delta):
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
	pass
	
func _apply_gravity(delta):
	movement.y += PlayerVariables.GRAVITY * delta
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		state = die
		
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "die":
		get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Gate2_body_entered(body):
	if body.name == "Player" and (state != die):
		print(state)
		get_tree().change_scene(next_scene)
	pass # Replace with function body.
	
func _screen_shake():
	screen_shake.stop_shake = false
	shake_audio_player.play(0)
	shake_particles.emitting = true
