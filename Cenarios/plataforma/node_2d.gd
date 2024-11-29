extends Node2D

const WAIT_DURATION := 1.0

@onready var platform := $animatable as Node2D  # Substituir AnimatableBody2D por Node2D ou o tipo certo
@export var move_speed := 27
@export var distance := 11

var follow := Vector2.ZERO
var platform_center := Vector2.ZERO

func _ready() -> void:
	platform_center = platform.position
	move_platform()

func _physics_process(delta: float) -> void:
	platform.position = platform.position.lerp(follow, 0.5)

func move_platform():
	var move_direction = Vector2.UP * distance
	var duration = move_direction.length() / float(move_speed)

	var platform_tween = create_tween()
	platform_tween.tween_property(platform, "position", platform_center + move_direction, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	platform_tween.tween_property(platform, "position", platform_center - move_direction, duration, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
