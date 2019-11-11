import actividades.*

class Socio {
	var property edad
	var property idiomas = []
	var property actividadesRealizadas = []
	var property maximoDeActividades 
	
	
	method esAdoradorDelSol(){
		return actividadesRealizadas.all({actividad => actividad.broncea()}) 
	}
	method actividadesEsforzadas(){
		return actividadesRealizadas.filter({actividad => actividad.implicaEsfuerzo()})
	}
	method realizaUnaActividad(unaActividad){
		if(maximoDeActividades == actividadesRealizadas.size()){
			self.error("supera su limite de actividades")
		}
		actividadesRealizadas.add(unaActividad)
	}
	method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad){
		return unaActividad.cuantosDiasLLeva() >= 4
	}
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad){
		if (self.esAdoradorDelSol()){
			return unaActividad.broncea()
		}else{
			return unaActividad.implicaEsfuerzo()
		}
	}
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad){
		return idiomas.any({unaActividad.idioma()})
	}
}		
		