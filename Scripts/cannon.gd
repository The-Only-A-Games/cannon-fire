extends CharacterBody3D

# Cannon attributes
var camera_sensitivity = 2

#Nodes
var camera
@export var camera_path : NodePath
@onready var marker_3d = $Marker3D
const PROJECTILE = preload("res://Scenes/projectile.tscn")

var health = 100

func _ready():
	camera = get_node(camera_path)

func _unhandled_input(event):
	if (event is InputEventMouseMotion):
		rotation_degrees.y -= event.relative.x * camera_sensitivity

func _process(delta):
	rotate_toward_mouse()

func rotate_toward_mouse():
	var mouse_pos = get_viewport().get_mouse_position()
	var from = camera.project_ray_origin(mouse_pos)
	var to = from + camera.project_ray_normal(mouse_pos) * 1000

	var space_state = get_world_3d().direct_space_state

	var query = PhysicsRayQueryParameters3D.new()
	query.from = from
	query.to = to
	query.exclude = [self]

	var result = space_state.intersect_ray(query)
	
	if result:
		var target = result.position
		target.y = global_transform.origin.y  # keep flat
		look_at(target, Vector3.UP)

func _physics_process(delta):
	if (Input.is_action_just_pressed("shoot")):
		shoot()
		
		
	health = get_node("/root/TestLevel").get_player_health()
	if (health <= 0):
		get_node("/root/TestLevel").show_death_menu()
		queue_free()

func shoot():
	var bullet = PROJECTILE.instantiate()
	marker_3d.add_child(bullet)
	
	bullet.global_transform = marker_3d.global_transform

func take_damage(n):
	health -= n
