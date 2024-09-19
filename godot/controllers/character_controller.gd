extends CharacterBody3D

@export
var speed = 1.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity_vector") \
		* ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	var inputs = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	velocity += Vector3(inputs.x, 0.0, inputs.y) * speed * delta
	velocity += gravity * delta
	move_and_slide()
