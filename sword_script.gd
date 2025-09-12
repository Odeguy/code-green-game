extends Node2D

class_name Sword

@export var accel: float
@export var speed: float
@export var atack: int
@onready var screen_size: Vector2 = get_viewport_rect().size

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("right"):
		$RigidBody2D.apply_torque(360 * accel)
	if event.is_action_pressed("left"):
		$RigidBody2D.apply_torque(-360 * accel)
		
func _physics_process(delta: float) -> void:
	var diff: Vector2 = (screen_size / 2) - $RigidBody2D.global_position
	$RigidBody2D.global_position += diff / 5
		
		
