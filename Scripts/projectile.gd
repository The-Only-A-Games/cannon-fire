extends Area3D


const SPEED = 30.0
const MAX_DISTANCE = 50.0
var travelDistance = 0.0

func _physics_process(delta):
	position += -transform.basis.z * SPEED * delta
	
	travelDistance += SPEED * delta
	
	if (travelDistance >= MAX_DISTANCE):
		queue_free()


func _on_body_entered(body):
	if (body.is_in_group("enemies")):
		body.take_damage(50.0)
		queue_free()
