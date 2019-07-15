extends Node2D

onready var tilemap : TileMap = $TileMap
onready var player : KinematicBody2D = $Player
onready var gate : Area2D = $TileMap/Gate
onready var player_animator : AnimationPlayer = $Player/AnimationPlayer
onready var player_sprite : = $Player/Sprite
onready var screen_shake : = $ScreenShake
onready var shake_audio_player : = $ScreenShake/AudioStreamPlayer
onready var shake_particles : = $ScreenShake/Particles2D

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

## STATE VARS ##
var idle : = "idle"
var die : = "die"
var jump : = "jump"
var run : = "run"

var audio_over = false

var state : = idle
# Called when the node enters the scene tree for the first time.
func _ready():
	## chekcing if singleton works
	## CHECK FOR PORTALS ##
	_screen_shake()
	
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
				if _directional_input():
						state = run
			else:
				state = jump
		die: 
			_apply_movement(0, delta)
			_apply_gravity(delta)
			if player_animator.current_animation != "die":
				player_animator.play("die")
				
		run:
			if player_animator.current_animation != "running":
				player_animator.play("running")
			if player.can_jump():
				var input = _directional_input()
				_apply_movement(input, delta)
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

	if state != die:
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

	tilemap.rotation_degrees = lerp(tilemap.rotation_degrees, room_target, PlayerVariables.ROOM_ACCEL*delta)
	
	## NEXT ROOM DECIDER ##
	last_gate_direction = gate_direction
	gate_direction = Vector2(round(cos(deg2rad(room_target))),round(sin(deg2rad(room_target))))

	## HANDLE ANIMATION #
	
	
	## GATE STATE LOGIC##
	

#func _animation_handler() -> void:
#	match player_animator.current_animation:
#		_: 
#			pass

func _directional_input() -> int:
	if audio_over:
		return 1

	return 0


func _on_Gate_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene(room_on_the_right)

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



func _on_AudioStreamPlayer_finished():
	audio_over = true
	pass # Replace with function body.

func _screen_shake():
	screen_shake.stop_shake = false
	shake_audio_player.play(0)
	shake_particles.emitting = true

	
