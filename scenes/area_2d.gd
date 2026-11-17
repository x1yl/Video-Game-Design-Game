extends Area2D

@export var key_type: String = "door"
@export var color: String = "green"

@onready var sprite: Sprite2D = $"../Sprite2D"

func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	# Adjust this to match how you detect your player
	if body is CharacterBody2D: 
		print("Picked up ", key_type, " key!")
		
		# Give the key data to the player's inventory
		if body.has_method("add_key"):
			body.add_key(key_type)
			
		queue_free() # Remove the key from the level
