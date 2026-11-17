extends TileMapLayer

@export var lever_scene: PackedScene
@export var door_scene: PackedScene

func _ready() -> void:
	# Spawn a red lever at (2, 5) connected to a red door at (8, 5)
	spawn_lever_and_door(Vector2i(2, 8), Vector2i(8, 5), Color.RED)
	
	# Spawn a blue lever at (4, 3) connected to a blue door at (10, 3)
	spawn_lever_and_door(Vector2i(4, 3), Vector2i(10, 3), Color.DODGER_BLUE)

func spawn_lever_and_door(lever_cell: Vector2i, door_cell: Vector2i, color: Color) -> void:
	var door: Door = door_scene.instantiate()
	door.door_color = color
	door.position = map_to_local(door_cell)
	add_child(door)
	
	var lever: Lever = lever_scene.instantiate()
	lever.lever_color = color
	lever.position = map_to_local(lever_cell)
	add_child(lever)
	
	lever.toggled.connect(door.set_open)
