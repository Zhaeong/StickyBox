extends Node2D

# Member variables
var screen_size
var pad_size
var direction = Vector2(1.0, 0.0)

const MOVE_SPEED = 150

func _ready():
	screen_size = get_viewport_rect().size
	set_process(true)
	get_node("moveAnim").initilizeLines()

func _process(delta):
	# Move left pad
	var player_pos = get_node("player").get_pos()

	if (Input.is_action_pressed("move_left")):
    	player_pos.x += -MOVE_SPEED * delta
	if (Input.is_action_pressed("move_right")):
    	player_pos.x += MOVE_SPEED * delta

	if (Input.is_action_pressed("move_up")):
    	player_pos.y -= MOVE_SPEED * delta
	if (Input.is_action_pressed("move_down")):
    	player_pos.y += MOVE_SPEED * delta

	get_node("player").set_pos(player_pos)
	get_node("moveAnim").update()
