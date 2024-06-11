extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		apply_central_force(basis.y * delta * 1000)

	if Input.is_action_pressed("left"):
		apply_torque(Vector3(0.0, 0.0, delta*100.0)) #rotate counterclockwise
		
	if Input.is_action_pressed("right"):
		apply_torque(Vector3(0.0, 0.0, -delta*100.0))
	
