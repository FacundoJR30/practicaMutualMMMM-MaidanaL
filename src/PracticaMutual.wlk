class Viaje {
	
	const property idioma = #{}
	
	method esInteresante() = idioma.size() > 1
	method implicaEsfuerzo()
	method sirveBroncearse()
	method cantDias()
	
}

class ViajeDePlaya inherits Viaje {
	const property largoDePlaya 
	
	override method cantDias() = largoDePlaya / 500
	
	override method implicaEsfuerzo() = largoDePlaya > 1200
	
	override method sirveBroncearse() = true
	
}

class ExcursionACiudad inherits Viaje{
	var property atracciones
	
	override method cantDias() = atracciones / 2 
	
	override method implicaEsfuerzo() = atracciones.between(5, 8)
	
	override method sirveBroncearse() = false
	override method esInteresante() = super() or atracciones == 5
}

 class CiudadTropical inherits ExcursionACiudad {
 	override method cantDias() = super() + 1
 	override method sirveBroncearse() = true
 }


class SalidaDeTrekking inherits Viaje{
	var property kilometros
	const property diasDeSol
	
	override method cantDias() = kilometros / 50
	
	override method implicaEsfuerzo() = kilometros > 80
	
	override method sirveBroncearse() = diasDeSol >= 200 or (diasDeSol.between(100, 200) and kilometros > 120)
	
	override method esInteresante() = super() and diasDeSol > 140
}

class ClasesDeGimnasia inherits Viaje {
	
	method initialize(){
		if(idioma != #{"español"}){
			self.error("solo se perimte clase de gimnasia en español")
		}
	}
	override method cantDias() = 1
	override method implicaEsfuerzo() = true
	override method sirveBroncearse() = false	
}