extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Lang.Language == 0:
		$Label.text = "Apos  reprovar diversas materias e considerar largar aescola de magia, uma bruxinha resolveu que adentraria as lendarias Cavernas Rubix a procura do Pergaminho da Verdade. A bruxa sabia que as cavernas sãao magicas e escondem perigos, mas sabe tambem que sacrificios precisam ser feitos."
	elif Lang.Language == 1:
		$Label.text = "After failing many classes in Witchcraft School, a little witch decided to enter the legendary Rubix Caves in search of the Scroll of Truth. She knew the magical caves were dangerous, but also, that sacrifices must be made. "
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Scenes/Rooms/Cutscene.tscn")
#	pass
