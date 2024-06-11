extends RigidBody3D

@export_range(750.0, 3000.0) var thrust: float = 1000.0
@export var torque_thrust: float = 100.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		apply_central_force(basis.y * delta * thrust)

	if Input.is_action_pressed("left"):
		apply_torque(Vector3(0.0, 0.0, delta*torque_thrust)) #rotate counterclockwise
		
	if Input.is_action_pressed("right"):
		apply_torque(Vector3(0.0, 0.0, -delta*torque_thrust))
	


func _on_body_exited(body: Node) -> void:
	if "goal" in body.get_groups():
		complete_level(body.file_path)
	if "hazard" in body.get_groups():
		crash_sequence()
		
func crash_sequence() -> void:
	print("Kaboom!")
	get_tree().reload_current_scene()

func complete_level(next_level_file: String) -> void:
	get_tree().change_scene_to_file(next_level_file)
