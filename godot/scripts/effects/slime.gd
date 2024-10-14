extends Node3D

func move() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 0
func idle() -> void:
	$AnimationTree["parameters/Blend/blend_amount"] = 1
	
@onready
var blob_material: StandardMaterial3D = %Cube.get_surface_override_material(0)

@export_category("Hot/Cold")
@export_color_no_alpha
var hot_color
@export_color_no_alpha
var cold_color
var neutral_color

func _ready() -> void:
	neutral_color = blob_material.albedo_color
	var bubble_tween = create_tween()
	bubble_tween.set_loops()
	bubble_tween.tween_property(blob_material, "albedo_texture:noise:offset:y", 100, 1).as_relative()

func heat_up() -> void:
	var hot_tween = create_tween()
	hot_tween.tween_property(blob_material, "albedo_color", hot_color, 1)
	$Sparks.emitting = true
	
func cool_down() -> void:
	var cold_tween = create_tween()
	cold_tween.tween_property(blob_material, "albedo_color", cold_color, 1)
