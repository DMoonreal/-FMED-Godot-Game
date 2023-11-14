extends Node
var scorejugador=0
func _ready():
	$Player.connect("scoreUP",subirScore)
	$Player.connect("PlayerDied",morir)
	$MusicaFondo.play()
	if SaveScore.game_data.Max_Score > 0: 
		$HBoxContainer.show() 
		$HBoxContainer/Label2.text = str(SaveScore.game_data.Max_Score)
	
func subirScore():
	$Label.text = ""
	scorejugador+=1
	if SaveScore.game_data.Max_Score < scorejugador :
		SaveScore.game_data.Max_Score = scorejugador
		SaveScore.save_data()
	$Score.text = str(scorejugador)
func morir():
		
		$DeathScreen/HBoxContainer/FinalScore.text = str(scorejugador)
		$DeathScreen.show()
		get_tree().paused=true
