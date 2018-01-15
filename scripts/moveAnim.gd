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
	var player_pos = get_node("../playerKinematic2D/player").get_pos()
	var player_size = get_node("../playerKinematic2D/player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	for i in range(0, numLines):
		lineArray.append(createLinePoint(player_pos, player_size, ground_pos))

func createLinePoint(playerPos, playerSize, groundPos):
	var lineStart_x = rand_range(playerPos.x - (playerSize.x/2), playerPos.x + (playerSize.x/2))
	var lineEnd_x = rand_range(playerPos.x - (playerSize.x/2) - 40, playerPos.x + (playerSize.x/2) + 40)
	
	var lineStart = Vector2(playerPos.x - lineStart_x, playerPos.y - playerPos.y + (playerSize.y / 2))
	var lineEnd = Vector2(lineEnd_x, groundPos.y)

	return [lineStart, lineEnd]

		
func drawLines():
	var player_pos = get_node("../playerKinematic2D/player").get_pos()
	
	for i in range(0, lineArray.size()):
		var lineStart = Vector2(player_pos.x + lineArray[i][0][0], player_pos.y + lineArray[i][0][1])
		draw_line(lineStart, lineArray[i][1], Color(0, 90, 90), 1)
		
func updateLines():
	pass