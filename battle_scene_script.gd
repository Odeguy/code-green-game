extends Node2D

class_name Battle

var main_menu: Main_Menu
@export var sword_scene: PackedScene
@export var flyer_scene: PackedScene
@export var heart_scene: PackedScene
@onready var screen_size: Vector2 = get_viewport_rect().size
@onready var escalation: int = 1
@onready var counter: int = 0
@export var health: int = 100

func _ready() -> void:
	var sword: Sword = sword_scene.instantiate()
	sword.position = screen_size / 2
	add_child(sword)
	
	var heart: Heart = heart_scene.instantiate()
	heart.position = screen_size / 2
	add_child(heart)
	await heart.broken
	get_tree().paused = true
	print("you died")
	
	
func _process(delta: float) -> void:
	counter += 1
	if counter % 5000 == 0: escalation += 1
	if counter % 20 == 0: if (randi() % 10) < (escalation + 1): spawn_flyer()
	
func spawn_flyer() -> void:
	var flyer: Flyer = flyer_scene.instantiate()
	
	var x_axis: bool
	var y_axis: bool
	if (randi() % 2) + 1 == 1: x_axis = true
	else: x_axis = false
	if (randi() % 2) + 1 == 1: y_axis = true
	else: y_axis = false
	
	if x_axis: flyer.position.x = screen_size.x
	else: flyer.position.x = 0
	if y_axis: flyer.position.y = screen_size.y
	else: flyer.position.y = 0
	
	var radius: int = (randi() % 15) + 15
	var color: Color = Color(randf(), randf(), randf())
	var speed: int = (randi() % 3) * escalation + 1
	flyer.set_params(radius, color, speed)
	
	add_child(flyer)
	
