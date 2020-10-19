class Pared {
	var property position
	var property image = "pared.png"
	var property resistencia = 5
	
	
	method disminuirResistencia(){
	 	if(resistencia > 1){
		resistencia -- }
		else {
			resistencia --
			image = "paredRota.png"
		}	
	}
	
	}
