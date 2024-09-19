extends Node3D

func _process(delta: float) -> void:
	$Skeleton3D/Cube.get_surface_override_material(0)["albedo_texture"].noise.offset.y += delta * 10

func move() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 0
func idle() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 1
