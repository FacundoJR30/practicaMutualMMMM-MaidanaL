import PracticaMutual.*

class MyException inherits wollok.lang.Exception {}

class Socios {
	const actividades = []	
	const property actMax = 0
	const property edad = 0 
	const property idioma = #{}
		
	method atraeASocio(act)	
	method esAdoradorDelSol(){return actividades.all({a => a.sirveBroncearse()})}
	method actividadesForzadas(){return actividades.filter({a => a.implicaEsfuerzo()})}
	method actividades(act){
		if(actividades.size() == actMax){
			throw new MyException(message = "Se superó la cantidad maxima de actividades")
		
		}
		else{
			actividades.add(act)
		}
	} 
}

class SocioTranquilo inherits Socios {
	override method atraeASocio(act){return act.cantDias() > 3}
}

class SocioCoherente inherits Socios {
	override method atraeASocio(act){if(self.esAdoradorDelSol()){act.sirveBroncearse()}else{act.implicaEsfuerzo()}}
}

class SocioRelajado inherits Socios {
	override method atraeASocio(act){
		return act.idioma().contains(self.idioma())
	}
}