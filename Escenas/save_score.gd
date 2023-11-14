extends Node

const SAVELIFE = "user://SAVEFILE.save"

var game_data = {
	"Max_Score" : 0,
}

func _ready():
	load_data()
	
func  load_data():
	var file = FileAccess.open(SAVELIFE,FileAccess.READ)
	if file == null:
		save_data()
	else:	
		game_data = file.get_var()
	file = null

func save_data():
	var file = FileAccess.open(SAVELIFE,FileAccess.WRITE)
	file.store_var(game_data)
	file = null
