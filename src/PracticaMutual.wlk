class Viaje {
	
	const property idioma = #{}
	const implicaEsfuerzo = false
	const sirveBroncearse = false
	const cantDias = 0 
	
	method esInteresante(){return idioma.size() > 2}
	method implicaEsfuerzo()
	method sirveBroncearse()
	method cantDias()
}

class ViajeDePlaya inherits Viaje {
	const property largoDePlaya 
	
	override method cantDias(){
		return largoDePlaya / 500
	}
	
	override method implicaEsfuerzo(){
		return largoDePlaya > 1200
	}
	
	override method sirveBroncearse(){ return true}
	
}

class ExcursionACiudad inherits Viaje{
	const property atracciones
	
	override method cantDias(){ return atracciones / 2 }
	
	override method implicaEsfuerzo(){return atracciones.between(5, 8)}
	
	override method sirveBroncearse(){return false}
	override method esInteresante(){return super() or atracciones == 5}
}

 class CiudadTropical inherits ExcursionACiudad {
 	override method cantDias(){return super() + 1}
 	override method sirveBroncearse(){ return true}
 }


class SalidaDeTrekking inherits Viaje{
	const property kilometros
	const property diasDeSol
	
	override method cantDias(){
		return kilometros / 50
	}
	
	override method implicaEsfuerzo(){return kilometros > 80}
	
	override method sirveBroncearse(){return diasDeSol > 200 or (diasDeSol.between(100, 200) and kilometros > 120)}
	
	override method esInteresante(){return super() and diasDeSol > 140}
}

class ClasesDeGimnasia inherits Viaje {
	
	override method idioma(){idioma.add("Español")}
	override method cantDias() = 1
	override method implicaEsfuerzo(){return true}
	override method sirveBroncearse(){return false}	
}