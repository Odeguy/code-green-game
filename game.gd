extends Node2D

class_name Game

@export var main_menu_scene: PackedScene

func _ready() -> void:
	var menu: Main_Menu = main_menu_scene.instantiate()
	add_child(menu)
