extends StaticBody2D
@export var arc_radius = 478
var collision_speed = 10.0

func _ready() -> void:
	%GlassBulb.position.y = -arc_radius
	%GlassBulb2.position.y = arc_radius

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var b1 = %GlassBulb.position + Vector2(0,arc_radius*3)
	var b2 = %GlassBulb2.position + Vector2(0,arc_radius*3)
	%GlassBulb.position.x = sqrt(pow(arc_radius, 2) - pow((fmod(b1.y,2*arc_radius) - arc_radius), 2)) - 148
	%GlassBulb2.position.x = sqrt(pow(arc_radius, 2) - pow((fmod(b2.y,2*arc_radius) - arc_radius), 2)) - 148
	#print(arc_radius^2)
