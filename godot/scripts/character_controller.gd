extends CharacterBody3D

@export
var speed = 1.0
@export
var turn_speed = 1.0

@export_node_path("Node3D")
var camera_rig_path
@onready
var camera_rig: Node3D = get_node_or_null(camera_rig_path)

var hot = false

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity_vector") \
		* ProjectSettings.get_setting("physics/3d/default_gravity")
		
func _process(delta: float) -> void:
	if velocity != Vector3.ZERO:
		$Slime.transform = interpolate_towards_velocity($Slime.transform, delta)
		$Slime.move()
	else:
		$Slime.idle()
	
func interpolate_towards_velocity(xform: Transform3D, delta: float) -> Transform3D:
	if (velocity * Vector3(1.0, 0.0, 1.0)).is_zero_approx():
		return xform
	else:
		return xform.interpolate_with(xform.looking_at(xform.origin + velocity), delta * turn_speed)

func _physics_process(delta: float) -> void:
	var inputs = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	
	velocity *= Vector3.UP ## Kill horizontal movement
	velocity += get_camera_direction() * Vector3(inputs.x, 0.0, inputs.y) * speed
	velocity += gravity * delta
	move_and_slide()

func get_camera_direction() -> Basis:
	if camera_rig:
		return Basis.from_euler(Vector3.UP * camera_rig.rotation.y)
	else:
		return Basis.IDENTITY
		
func heat_up():
	hot = true
	$Slime.heat_up()
