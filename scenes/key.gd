extends Area2D

@export var key_type: String = "door"
@export_color_no_alpha  var color: Color = Color.GREEN

@onready var sprite: Sprite2D = $Sprite2D

var toggle: bool = false

func _ready() -> void:
	sprite.self_modulate= color

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D: 
		print("In lever hitbox")
		toggle = true		


func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D: 
		print("Left lever hitbox")
		toggle = false		
