extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if Lang.Language == 0:
		$Label.text = "E dentro do bau havia um pergaminho. E no pergaminho estava escrito:\n \"Voce nãao precisa de pergaminhos magicos. Ir bem na faculdade nao e soo que importa. So uma bruxa poderosa saberia chegar ateaqui!\""
	elif Lang.Language == 1:
		$Label.text = "And in chest she found the scroll. It read:\n \"You don't need any secret knowlege to succeed. Being good at college isn't everything. Only a powerful witch could've gotten here!\'"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Game.tscn")
#	pass
