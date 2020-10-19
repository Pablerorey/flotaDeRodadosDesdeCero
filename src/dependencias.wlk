import rodados.*
import pedidos.*

class Dependencia {
	var property empleados = 0
	const flota = []
	const pedidos = []
	
	method agregarVariosPedidos(lista){
		pedidos.addAll(lista)
	}
	
	method quitarVariosPedidos(lista){
		pedidos.removeAll(lista)
	}
	
	method contratarEmpleados(cantidad){
		empleados = cantidad
	}
	
	method despedirEmpleados(cantidad){
		empleados = (empleados - cantidad).max(0)
	}
	
	method agregarAFlota(rodado){
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado){
		flota.remove(rodado)
	}
	
	method agregarVariosRodados(rodados){
		flota.addAll(rodados)
	}
	
	method quitarVariosRodados(rodados){
		flota.removeAll(rodados)
	}
	
	method pesoTotalFlota(){
		return flota.sum({r=>r.peso()})
	}
	
	method estaBienEquipada(){
		return flota.size() >= 3 and flota.all({r=>r.velocidadMaxima() >= 100})
	}
	
	method capacidadTotalEnColor(color){
		return flota.filter({r=>r.color() == color}).sum({r=>r.capacidad()})
	}
	
	method colorDelRodadoMasRapido(){
		return flota.max({r=>r.velocidadMaxima()}).color()
	}
	
	method capacidadTotal(){
		return flota.sum({r=>r.capacidad()})
	}
	method capacidadFaltante(){
		return empleados - self.capacidadTotal()
	}
	
	method esGrande(){
		return empleados >= 40 and flota.size() >= 5
	} 
	
	method totalDePasajeros(){
		return pedidos.sum({p=>p.cantidadDePasajeros()})
	}
	
	method pedidosNosatisfechos(){
		return pedidos.filter({p=>flota.all({auto=> not p.puedeSatisfacer(auto)})})
	}
	
	method todosLosPedidosTienen(color){
		return pedidos.all({p=>p.contieneColor(color)})
	}
	
	method relajarPedidos(){
		pedidos.forEach({p=>p.relajar()})
	}
	
	
	
}
