extends Sprite2D
@export var spin = 1
@export var spin_multiplier = PI

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$ParticleIn.rotation_degrees += spin * spin_multiplier
	$ParticleOut.rotation_degrees -= spin * spin_multiplier
	self.position.y += self.get_parent().get_parent().get("collision_speed") * -self.get_meta("side")
	#print(abs(self.position.y - (float(-self.get_meta("side")) * float(self.get_parent().get_parent().get("arc_radius")))))
	if abs(self.position.y - (float(-self.get_meta("side")) * float(self.get_parent().get_parent().get("arc_radius")))) < self.get_parent().get_parent().get("collision_speed"):
		bump()

func bump():
	self.set_meta("side", -self.get_meta("side"))
