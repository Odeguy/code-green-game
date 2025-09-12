extends Node2D

class_name Main_Menu

@export var battle_scene: PackedScene

func _on_start_button_pressed() -> void:
	var battle: Battle = battle_scene.instantiate()
	add_sibling(battle)
	battle.main_menu = self
	self.hide()
	$StartButton.mouse_filter = 2
	
func _ready() -> void:
	randomize()
