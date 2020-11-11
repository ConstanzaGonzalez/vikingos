class Vikingo {
	var property castaSocial 
	var moneda = 0
	
	method puedeIr() = castaSocial.puedeIr(self) and self.productivo()
	
	method productivo()
	
	method cobrar(unaMoneda){
		moneda += unaMoneda
	}
}

class Soldado inherits Vikingo{
	var vidasCobradas
	var cantidadArmas
	
	override method productivo() = vidasCobradas > 20 and cantidadArmas > 0
	
	method tieneArmas() = cantidadArmas > 0
}

class Granjero inherits Vikingo{
	var cantidadHijos
	var cantidadHectareas
	
	override method productivo() = cantidadHectareas >= 2 * cantidadHijos
	
	method tieneArmas() = false
}

class CastaSocial{
	method puedeIr(vikingo) = true
}

object jarl inherits CastaSocial{
	
	override method puedeIr(vikingo) = not vikingo.tieneArmas()
}

object karl inherits CastaSocial{
	
}

object thrall inherits CastaSocial{
	
}