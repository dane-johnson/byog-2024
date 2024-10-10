extends Node3D

func on_enter_hot_zone(body: Node3D) -> void:
	if body.has_method("heat_up"):
		body.heat_up()


func on_melt_zone_body_entered(body: Node3D) -> void:
	if "hot" in body and body.hot:
		$Stalagmite.melt()
		$Stalagmite2.melt()
