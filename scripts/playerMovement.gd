extends RigidBody2D

var move_left = false
var move_right = false
var move_up = false
var move_down = false
var move_speed = 10

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	move_left = false
	move_right = false
	move_up = false
	move_down = false

	pass
	
func _process(delta):
	
	if Input.is_action_pressed("move_left"): 
		move_left = true
	else:
		move_left = false
		
	if Input.is_action_pressed("move_right"): 
		move_right = true
	else:
		move_right = false
		
	if Input.is_action_pressed("move_up"): 
		move_up = true
	else:
		move_up = false
		
	if Input.is_action_pressed("move_down"): 
		move_down = true
	else:
		move_down = false
	
	if move_left: 
		self.apply_impulse(Vector2(),Vector2(-move_speed,0))
	if move_right: 
		self.apply_impulse(Vector2(),Vector2(move_speed,0))
	if move_up: 
		self.apply_impulse(Vector2(),Vector2(0,-move_speed))
	if move_down: 
		self.apply_impulse(Vector2(),Vector2(0,move_speed))