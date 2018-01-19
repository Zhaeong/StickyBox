extends Node2D

var lineArray = []

var numLinesStart = 6
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
	var player_sprite_pos = get_node("../playerMain/player").get_pos()
	var player_sprite_size = get_node("../playerMain/player").get_item_rect().size
	
	var player_pos = get_node("../playerMain").get_pos()	
	
	var ground_pos = get_node("../ground").get_pos()

	for i in range(0, numLinesStart):
		createLinePoint(player_pos, player_sprite_size, ground_pos, 20, 20)

func createLinePoint(playerPos, playerSize, groundPos, groundLeftOffset, groundRightOffset):
	var lineStart_x = rand_range(playerPos.x - (playerSize.x/2) + 10, playerPos.x + (playerSize.x/2) -10)
	var lineEnd_x = rand_range(playerPos.x - (playerSize.x/2) - groundLeftOffset, playerPos.x + (playerSize.x/2) + groundRightOffset)
	
	var lineStart = Vector2(playerPos.x - lineStart_x, playerPos.y - playerPos.y + (playerSize.y / 2))
	var lineEnd = Vector2(lineEnd_x, groundPos.y)
	lineArray.append([lineStart, lineEnd])
	return [lineStart, lineEnd]

func deleteLowestLinePoint():
	var least = lineArray[0][1].x
	var index = 0
	for i in range(0, numLinesStart):
		var pointVal = lineArray[i][1].x
		if pointVal < least:
			index = i
	lineArray.remove(index)
	
func deleteGreatestLinePoint():
	var greatest = lineArray[0][1].x
	var index = 0
	for i in range(0, numLinesStart):
		var pointVal = lineArray[i][1].x
		if pointVal > greatest:
			index = i
	lineArray.remove(index)
	
func drawLines():
	var player_pos = get_node("../playerMain").get_pos()
	for i in range(0, lineArray.size()):
		var lineStart = Vector2(player_pos.x + lineArray[i][0][0], player_pos.y + lineArray[i][0][1])
		draw_line(lineStart, lineArray[i][1], Color(0, 0, 0), 3)
		
func updateLines():
	pass