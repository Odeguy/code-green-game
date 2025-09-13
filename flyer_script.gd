extends Node2D

class_name Flyer

var radius: int
var color: Color
var speed: int
@onready var screen_size: Vector2 = get_viewport_rect().size

func _ready() -> void:
	$RigidBody2D/Panel.get_theme_stylebox("panel").bg_color = color
	$RigidBody2D/Panel.get_theme_stylebox("panel").expand_margin_left = radius
	$RigidBody2D/Panel.get_theme_stylebox("panel").expand_margin_top = radius
	$RigidBody2D/Panel.get_theme_stylebox("panel").expand_margin_right = radius
	$RigidBody2D/Panel.get_theme_stylebox("panel").expand_margin_bottom = radius

func _process(delta: float) -> void:
	var diff: Vector2 = (screen_size / 2) - $RigidBody2D.global_position
	$RigidBody2D.apply_central_force(diff * speed)
	
func set_params(radi: int, col: Color, fast: int) -> void:
	radius = radi
	color = col
	speed = fast



func _on_rigid_body_2d_body_entered(body: Node) -> void:
	var opp = body.get_parent()
	if opp is Sword:
		$RigidBody2D/CollisionShape2D.disabled = true
		while self.modulate.a > 0:
			self.modulate.a -= 0.02
			await get_tree().process_frame
		self.queue_free()
	
