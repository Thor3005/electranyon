extends CharacterBody2D
var mousein = false
var spin = 0.5

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	self.velocity.y = 8
	self.velocity.x = 12

func _process(delta: float) -> void:
	$Label.text = var_to_str(int(1/spin))

func _physics_process(delta: float) -> void:
	var collision = move_and_collide(velocity)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	#print(get_last_slide_collision())
	#print(get_slide_collision(0))
	#if get_last_slide_collision() != null:
		#if (round(wrapf(0, 180.0, get_last_slide_collision().get_angle()))/90.0) == 1 or (round((wrapf(0, 180.0, get_last_slide_collision().get_angle()))/90.0)) == 0:
			#self.velocity.y *= -1
		#else:
			#self.velocity.x *= -1

func _input(event: InputEvent) -> void:
	if mousein and Input.is_action_just_pressed("lmb"):
		var fission = self.duplicate()
		get_tree().current_scene.add_child(fission)
		fission.velocity = velocity * -1.1
		fission.spin = 1/((1/spin)+1)


func _on_click_mouse_entered() -> void:
	mousein = true


func _on_click_mouse_exited() -> void:
	mousein = false
