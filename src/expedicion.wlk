class Expedicion {
	const property vikingos = []
	const invasiones = []
	
	method subirVikingo(vikingo){
		if (not vikingo.puedeIr()) self.error("El vikingo no esta capacitado para la expedicion")
		else vikingos.add(vikingo)
	}
	
	method valeLaPena() = invasiones.all({invasion => invasion.valeLaPena(self.cantidadVikingos())})
	
	method cantidadVikingos() = vikingos.size()
	
	method realizarExpedicion(){
		invasiones.forEach({invasion => invasion.invadir(self)})
	}
	
	method repartirBotin(moneda){
		vikingos.forEach({vikingo => vikingo.cobrar(moneda/self.cantidadVikingos())})
	}
}

//4) Si se puede agregar una clase nueva que sea Castillo y que entienda los mismo mensajes que Capital y Aldea
// para que puedan entender los mismos mensajes(polimorfismo) pero que la solucion depedan de cada clase

class Capital{
	var defensores
	
	method valeLaPena(cantidadVikingos) = defensores >= 3 * cantidadVikingos
	
	method invadir(expedicion){
		expedicion.repartirBotin(defensores)
	}
	
}
class Aldea{
	var crucifijos
	
	method valeLaPena(cantidadVikingos) = crucifijos >= 15
	
	method invadir(expedicion){
		expedicion.repartirBotin(crucifijos)
	} 
}
class AldeaAmurallada inherits Aldea{
	const vikingosComitiva
	
	override method valeLaPena(cantidadVikingos) = cantidadVikingos >= vikingosComitiva 
}

