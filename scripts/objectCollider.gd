extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("../colid").connect("body_enter",self,"_on_Area2D_body_enter")
	get_node("../colid").connect("body_exit",self,"_on_Area2D_body_exit")
	pass


func _on_Area2D_body_enter( body ):
	var player_pos = get_node("../playerMain/player").get_pos()
	var player_size = get_node("../playerMain/player").get_item_rect().size
	var ground_pos = get_node("../ground").get_pos()
	
	get_node("../moveAnim").createLinePoint(player_pos, player_size, ground_pos)
	pass # replace with function body
