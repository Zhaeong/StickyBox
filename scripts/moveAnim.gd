extends Node2D

var lineArray = []

var numLinesStart = 4
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	self.initilizeLines()
	
func _draw():
	drawLines()
		
func _process(delta):
	self.update()

func initilizeLines():
	var player_pos = get_node("../playerMain/player").get_pos()
	var player_size = get_node("../playerMain/player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	for i in range(0, numLinesStart):
		createLinePoint(player_pos, player_size, ground_pos)

func createLinePoint(playerPos, playerSize, groundPos):
	var lineStart_x = rand_range(playerPos.x - (playerSize.x/2), playerPos.x + (playerSize.x/2))
	var lineEnd_x = rand_range(playerPos.x - (playerSize.x/2) - 40, playerPos.x + (playerSize.x/2) + 40)
	
	var lineStart = Vector2(playerPos.x - lineStart_x, playerPos.y - playerPos.y + (playerSize.y / 2))
	var lineEnd = Vector2(lineEnd_x, groundPos.y)
	lineArray.append([lineStart, lineEnd])
	return [lineStart, lineEnd]
		
func drawLines():
	var player_pos = get_node("../playerMain").get_pos()
	for i in range(0, lineArray.size()):
		var lineStart = Vector2(player_pos.x + lineArray[i][0][0], player_pos.y + lineArray[i][0][1])
		draw_line(lineStart, lineArray[i][1], Color(0, 90, 90), 1)
		
func updateLines():
	pass