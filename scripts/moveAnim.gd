extends Node2D

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
func _draw():

	var numLines = 2
	
	var player_pos = get_node("../player").get_pos()
	var player_size = get_node("../player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	for i in range(0, numLines):		
		var lineStart_x = rand_range(player_pos.x - (player_size.x/2), player_pos.x + (player_size.x/2))
		var lineEnd_x = rand_range(player_pos.x - (player_size.x/2) - 40, player_pos.x + (player_size.x/2) + 40)
		var lineStart = Vector2(lineStart_x, player_pos.y + (player_size.y / 2))
		var lineEnd = Vector2(lineEnd_x, ground_pos.y)
		draw_line(lineStart, lineEnd, Color(0, 90, 90), 1)
		

	#var player_size = get_node("../player").get_texture().get_size()

func _process(delta):
	# Move left pad
	pass
