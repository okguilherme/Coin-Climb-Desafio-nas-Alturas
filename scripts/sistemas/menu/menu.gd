extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_pressed():
	Transicao.scene_path = "res://cenas/jogo/nivel_1.tscn"
	Transicao.fade_in()
