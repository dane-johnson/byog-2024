extends Node3D

func move() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 0
func idle() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 1
