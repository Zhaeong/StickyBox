extends Node2D

var lineArray = []

var numLines = 4
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
func _draw():
	drawLines()
		
func _process(delta):

	pass

func initilizeLines():
	var player_pos = get_node("../player").get_pos()
	var player_size = get_node("../player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	for i in range(0, numLines):
		var lineStart_x = rand_range(player_pos.x - (player_size.x/2), player_pos.x + (player_size.x/2))
		var lineEnd_x = rand_range(player_pos.x - (player_size.x/2) - 40, player_pos.x + (player_size.x/2) + 40)
		
		var lineStart = Vector2(player_pos.x - lineStart_x, player_pos.y - player_pos.y + (player_size.y / 2))
		
		var lineEnd = Vector2(lineEnd_x, ground_pos.y)
		
		var lineObj = [lineStart, lineEnd]
		lineArray.append(lineObj)
		
func drawLines():
	var player_pos = get_node("../player").get_pos()
	
	for i in range(0, lineArray.size()):
		var lineStart = Vector2(player_pos.x + lineArray[i][0][0], player_pos.y + lineArray[i][0][1])
		draw_line(lineStart, lineArray[i][1], Color(0, 90, 90), 1)
		
func updateLines():
	pass