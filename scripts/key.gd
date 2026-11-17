extends Area2D
class_name Lever

signal toggled(is_open: bool, lever_color: Color)

var toggle: bool = false

@export var lever_color: Color = Color.WHITE:
	set(value):
		lever_color = value
		if is_node_ready():
			$Sprite2D.modulate = lever_color

var is_activated: bool = false

func _ready() -> void:
	$Sprite2D.modulate = lever_color
	
func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: 
		print("In lever hitbox")
		toggle = true
		interact()

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: 
		print("Left lever hitbox")
		toggle = false		

func interact() -> void:
	is_activated = !is_activated
	toggled.emit(is_activated, lever_color)
