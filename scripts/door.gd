extends StaticBody2D
class_name Door

@export var door_color: Color = Color.WHITE

func _ready() -> void:
	$Sprite2D.modulate = door_color

func set_open(is_open: bool, _color: Color = Color.WHITE) -> void:
	print("open")
	# Hide sprite and disable collision when open
	$Sprite2D.visible = !is_open
	$CollisionShape2D.set_deferred("disabled", is_open)
