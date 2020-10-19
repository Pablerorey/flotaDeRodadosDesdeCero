import rodados.*

class Pedido {
	const coloresIncompatibles = #{}
	
	var property distancia
	var property tiempoMaximo
	var property cantidadDePasajeros
	
	method agregarColores(colores){
		coloresIncompatibles.addAll(colores)
	}
	
	method quitarColor(color){
		coloresIncompatibles.remove(color)
	}
	
	method contieneColor(color){
		return coloresIncompatibles.contains(color)
	}
	
	method velocidadRequerida(){
		return distancia / tiempoMaximo 
	}
	
	method puedeSatisfacer(auto){
		return auto.velocidadMaxima() >= self.velocidadRequerida() + 10
		and auto.capacidad() >= cantidadDePasajeros
		and not coloresIncompatibles.contains(auto.color())
	}
	
	method acelerar(){
		tiempoMaximo += 1
	}
	
	method relajar(){
		tiempoMaximo -= 1
	}			
}
