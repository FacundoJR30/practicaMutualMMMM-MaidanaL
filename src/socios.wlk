import PracticaMutual.*

/*class MyException inherits wollok.lang.Exception {}*/

class Socios {
	const actividades = []	
	const property actMax = 0
	var property edad
	const property idioma = #{}
		
	method esAdoradorDelSol() = actividades.all({a => a.sirveBroncearse()})
	method actividadesForzadas() = actividades.filter({a => a.implicaEsfuerzo()})
	method actividades(act){
		if(actividades.size() == actMax){
			/*throw new MyException(message = "Se superó la cantidad maxima de actividades")*/
			self.error("Se superó la cantidad maxima de actividades")
		}
		actividades.add(act) /* Es innecesario poner un else pq si se cumple la condicion de que llego al limite de actividades esto no se ejecuta */
	} 
	method atraeASocio(act)	/*Metodo Abstracto */
}

class SocioTranquilo inherits Socios {
	override method atraeASocio(act) = act.cantDias() >= 4
}

class SocioCoherente inherits Socios {
	override method atraeASocio(act){
		 return if(self.esAdoradorDelSol()) act.sirveBroncearse() else act.implicaEsfuerzo()		
	}
}

class SocioRelajado inherits Socios {
	override method atraeASocio(act) = not idioma.intersection(act.idioma()).isEmpty()
}