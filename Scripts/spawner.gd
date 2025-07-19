extends CollisionShape3D

var count = 0
var enemies = []
const ENEMY = preload("res://Scenes/enemy.tscn")
@onready var spawn_point = $Marker3D
@export var nav : NodePath
var get_nav

func _ready():
	get_nav = get_node(nav)
func _physics_process(delta):
	if (enemies.size() < 1):
		spawn_enemy()
		count += 1
	
	if (!is_instance_valid(enemies.get(0))):
		remove_enemy(enemies.get(0))

func spawn_enemy():
	var enemy = ENEMY.instantiate()
	get_nav.add_child(enemy);
	#spawn_point.add_child(enemy)
	enemies.append(enemy)

	enemy.global_transform = spawn_point.global_transform

func remove_enemy(enemyy):
	if (enemyy in enemies):
		enemies.erase(enemyy)
