extends CharacterBody3D


# Enemy attributes
const SPEED = 2
var health = 100

# Nodes
#var player_path = %Cannon.get_path()
@onready var nav_agent = $NavigationAgent3D
var player

func _ready():
	player = get_parent().get_parent().get_node("Cannon")


func _physics_process(delta):	
	velocity = Vector3.ZERO
	
	if (player != null):
		nav_agent.set_target_position(player.global_position)
		var next_nav_point = nav_agent.get_next_path_position()
		var lookDirection = Vector3(player.global_position.x, 0, player.global_position.z)
		look_at(lookDirection)
		
		velocity = (next_nav_point - global_position).normalized() * SPEED
		move_and_slide()
	
	if (health <= 0):
		print("Enemy just dies")
		queue_free()


func _on_area_3d_body_entered(body):
	if (body.is_in_group("player")):
		print("hurt player")
		queue_free()


func take_damage(amount):
	health -= amount
	print(health)

#func get_player(player_node):
	#get_node(player_node)
