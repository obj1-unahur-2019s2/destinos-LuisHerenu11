class Viaje {
	var property idioma = []
	
	method cuantosDiasLLeva()
	method agregarIdioma(unIdioma){
		idioma.add(unIdioma)
	}
	method idiomasEnElViaje(){
		return idioma
	}
	method implicaEsfuerzo()
	method broncea()
	method esInteresante(){
		return idioma.size() > 1
	}
	method esRecomendada(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) 
		and not unSocio.actividadesRealizadas().contains({self})
	}
}

class ViajeDePlaya inherits Viaje{
	var property largoDePlaya
	
	override method cuantosDiasLLeva(){
		return largoDePlaya / 500
	}
	override method implicaEsfuerzo(){
		return largoDePlaya > 1200
	}
	override method broncea(){
		return true
	}
}

class ExcursionACiudad inherits Viaje{
	var property cantidadDeAtraccionesAVisitar
	
	override method cuantosDiasLLeva(){
		return cantidadDeAtraccionesAVisitar/2
	}
	override method implicaEsfuerzo(){
		return cantidadDeAtraccionesAVisitar >= 5 and cantidadDeAtraccionesAVisitar <= 8
	}
	override method broncea(){
		return false
	}
	override method esInteresante(){
		return super() or cantidadDeAtraccionesAVisitar == 5
	}
}

class ExcursionACiudadTropical inherits ExcursionACiudad{
	override method cuantosDiasLLeva(){
		return super() + 1
	}
	override method broncea(){
		return true
	}
}

class SalidaDeTrekking inherits Viaje{
	var property kilometros
	var property diasDeSol
	
	override method cuantosDiasLLeva(){
		return kilometros / 50
	}
	override method implicaEsfuerzo(){
		return kilometros > 80
	}
	override method broncea(){
		return diasDeSol > 200 or self.condicionAlternativa()
	}
	method condicionAlternativa(){
		return diasDeSol >= 100 and diasDeSol <= 200 and kilometros > 120
	}
	override method esInteresante(){
		return super() and diasDeSol > 140	
	}
}

class ClasesDeGimnasia {
	var property idioma = [espaniol]

	method cuantosDiasLLeva(){
		return 1
	}
	method implicaEsfuerzo(){
		return true
	}
	method broncea(){
		return false
	}
	method esRecomendada(unSocio){
		return unSocio.edad() >= 20 and unSocio.edad() <= 30
	}
}

class TallerLiterario{
	var property libros = []
	
	method idiomasUsados(){
		var idiomas = []
		idiomas.add(libros.idiomas().map({libro => libro.idioma()}))
		return idiomas
	}
	method cuantosDiasLLeva(){
		return libros.size() + 1
	}
	method implicaEsfuerzo(autor){
		return libros.any({libro => libro.cantidadDePaginas() > 500}) 
		or libros.all({libro => libro.nombreDeAutor() == autor}) and libros.size() > 1
	}
	method broncea(){
		return false
	}
	method esRecomendada(unSocio){
		return unSocio.idiomas().size() > 1
	}
}

class Libro{
	var property idioma
	var property cantidadDePaginas
	var property nombreDeAutor
}

object quechua{}
object aymara{}
object aleman{}
object frances{}
object hungaro{}
object ingles{}
object espaniol{}