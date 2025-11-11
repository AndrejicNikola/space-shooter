extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float
signal collision
var can_collide := true

func _ready():
	var rng := RandomNumberGenerator.new()
	
	var path: String = "res://Graphics/Meteors/" + str(rng.randi_range(1,3)) + ".png"
	$MeteorImage.texture = load(path)
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randf_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	position = Vector2(random_x, random_y)
	speed = rng.randi_range(200, 400)
	direction_x = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40, 100)
	var scale_meteor = rng.randf_range(0.07,0.14)
	scale = Vector2(scale_meteor, scale_meteor)
	
func _process(delta):
	position += Vector2(direction_x,1) * speed * delta
	rotation_degrees += rotation_speed * delta


func _on_body_entered(_body):
	if can_collide:
		collision.emit()
	
func _on_area_entered(area):
	if not can_collide: return
	can_collide = false
	
	area.call_deferred("queue_free")
	
	set_deferred("monitoring", false)
	#set_deferred("collision_layer", 0)
	#set_deferred("collision_mask", 0)
	#$CollisionShape2D.set_deferred("disabled", true)
	
	$Explosion.play()
	$MeteorImage.hide()
	await get_tree().create_timer(1).timeout
	call_deferred("queue_free")
