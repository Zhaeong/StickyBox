extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var rightNode
var leftNode

var colliderOffset = 70
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("../colid_right").connect("body_enter",self,"_on_Area2D_body_enter_right")
	get_node("../colid_right").connect("body_exit",self,"_on_Area2D_body_exit")
	
	get_node("../colid_left").connect("body_enter",self,"_on_Area2D_body_enter_left")
	
	rightNode = get_node("../colid_right")
	leftNode = get_node("../colid_left")
	set_process(true)


func _process(delta):
	var player_pos = get_node("../playerMain").get_pos()
	var new_pos_y = player_pos.y
	var new_pos_right_x = rightNode.get_pos().x
	var new_pos_left_x = leftNode.get_pos().x
	if(abs(rightNode.get_pos().x - player_pos.x) > colliderOffset):
		new_pos_right_x = player_pos.x + colliderOffset
	
	if(abs(player_pos.x - leftNode.get_pos().x) > colliderOffset):
		new_pos_left_x = player_pos.x - colliderOffset
	
	var new_pos_right = Vector2(new_pos_right_x, player_pos.y)
	var new_pos_left = Vector2(new_pos_left_x, player_pos.y)
		
	rightNode.set_pos(new_pos_right)
	leftNode.set_pos(new_pos_left)
	
func _on_Area2D_body_enter_right( body ):
	var player_sprite_pos = get_node("../playerMain/player").get_pos()
	var player_sprite_size = get_node("../playerMain/player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	var player_pos = get_node("../playerMain").get_pos()	
	
	get_node("../moveAnim").createLinePoint(player_pos, player_sprite_size, ground_pos, -20, 100)
	get_node("../moveAnim").deleteLowestLinePoint()
	#set new positon
	
	var new_pos = Vector2(player_pos.x + 100, player_pos.y)
	rightNode.set_pos(new_pos)
	
func _on_Area2D_body_enter_left( body ):
	var player_sprite_pos = get_node("../playerMain/player").get_pos()
	var player_sprite_size = get_node("../playerMain/player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	var player_pos = get_node("../playerMain").get_pos()	
	
	get_node("../moveAnim").createLinePoint(player_pos, player_sprite_size, ground_pos, 100, -20)
	get_node("../moveAnim").deleteGreatestLinePoint()
	#set new positon
	
	var new_pos = Vector2(player_pos.x - 100, player_pos.y)
	leftNode.set_pos(new_pos)
