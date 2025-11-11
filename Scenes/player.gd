extends CharacterBody2D

@export var speed := 250
var can_shoot: bool = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(500,100)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()
	
	if Input.is_action_just_pressed("q"):
		speed += 100
func on_collision_sound():
	$DamageSound.play()

func _on_laser_timer_timeout() -> void:
	can_shoot = true
