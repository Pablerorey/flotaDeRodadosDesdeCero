import wollok.game.*
import paredes.*

object norte{
	method mover(auto){
	     if(auto.position().y().between(0,8) and game.colliders(auto).map({o=>o.resistencia()}).sum() == 0)
	     auto.position(auto.position().up(1))
}		 		   
}

object sur{
	method mover(auto){
		 if(auto.position().y().between(1,10))
	     auto.position(auto.position().down(1))
}	
}

object este{
	method mover(auto){
		 if(auto.position().x().between(0,8))
	     auto.position(auto.position().right(1))
}	
}

object oeste{
	method mover(auto){
		 if(auto.position().x().between(1,10))
	     auto.position(auto.position().left(1))
}	
}

class ChevroletCorsa {
	var property image = "autitorojo.png"
	var property position = game.at(0,0)
	var property capacidad = 4
	var property velocidadMaxima = 150
	var property color = "ninguno"
	var property peso = 1300
	var property haciaDonde = null
	var property resistencia = 0
	
	const property porDondePaso = #{}
	
	method disminuirResistencia(){}

	method chocar(pared){
		pared.disminuirResistencia()
	}

	method moverse(direccion){
		direccion.mover(self)
		haciaDonde = direccion
		porDondePaso.add(self.position())
    }
    
    method repetirUltimoMovimiento() {
    	self.moverse(haciaDonde)
    }
    
    method pasoPor(posicion){
    	return porDondePaso.contains(posicion)
    } 
    
    method pasoPorFila(numero){
    	return porDondePaso.any({c=>c.y() == numero})
    }
    
    method recorrioFilas(lista){
    	return lista == porDondePaso.map({c=>c.y()}) 
    }
}

class RenaultKwid {

	var property color = "azul"
	var property tanque = uno
		
	method capacidad(){
		return tanque.capacidad()
	}
	
	method velocidadMaxima(){
		return tanque.velocidadMaxima()
	}
	
	method peso(){
		return tanque.peso()
	}	
}

object uno {
	var property capacidad = 4
	var property peso = 1200
	var property velocidadMaxima = 110
}

object dos {
	var property capacidad = 3
	var property peso = 1350
	var property velocidadMaxima = 120
}


object traffic { 
	var property color = "blanco"
	var property interior = comodo
	var property motor = pulenta
	
	method capacidad(){
		return interior.capacidad()
	}
	
	method velocidadMaxima(){
		return motor.velocidadMaxima()
	}
	
	method peso(){
		return 4000 + interior.peso() + motor.peso()
	}
	
	method setInteriorComodo(){
		interior = comodo 
	}
	
	method setInteriorPopular(){
		interior = popular
	}
	
	method setMotorPulenta(){
		motor = pulenta
	}
	
	method setMotorBataton(){
		motor = bataton
	}	
}

object comodo {
	var property capacidad = 5
	var property peso = 700 
}

object popular {
	var property capacidad = 12
	var property peso = 700
}

object pulenta {
	var property velocidadMaxima = 130
	var property peso = 800
}

object bataton {
	var property velocidadMaxima = 80
	var property peso = 500
}

class Especiales {
	var property capacidad
	var property velocidadMaxima
	var property peso
	var property color
}
