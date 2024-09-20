extends Area3D

func _ready() -> void:
	connect("body_entered", self.burn)

func burn(body: Node3D) -> void:
	if body.has_method("heat_up"):
		body.heat_up()
