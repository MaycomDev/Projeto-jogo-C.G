extends Node2D

const WAIT_DURATION := 1.0

@onready var platform := $Animate as AnimatableBody2D
@export var move_speed := 25
@export var distance := 75

var follow := Vector2.ZERO
var platform_center := Vector2.ZERO

func _ready() -> void:
	platform_center = platform.position
	move_platform()

func _physics_process(delta: float) -> void:
	platform.position = platform.position.lerp(follow, 0.5)

func move_platform():
	var move_direction = Vector2.RIGHT * distance
	var duration = move_direction.length() / float(move_speed)

	var platform_tween = create_tween()
	platform_tween.set_loops()
	platform_tween.tween_property(self, "follow", platform_center + move_direction, duration)
	platform_tween.tween_property(self, "follow", platform_center - move_direction, duration)
