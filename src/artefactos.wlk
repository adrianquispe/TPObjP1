import global.*
import refuerzos.*

class Arma {
	var nombre
	
	constructor(unNombre) {
		nombre = unNombre
	}
	
	method luchaArtefacto(personaje){
		return 3
	}
}

object collarDivino{
	var perlas = 5
	
	method modificarPerlas(nuevasPerlas){
		perlas = nuevasPerlas
	}
	method luchaArtefacto(personaje){
		return perlas
	}
}

class Mascara{
	var indice
	var property minimo = 4
	
	constructor(unIndice){
		indice = unIndice
	}
	
	method luchaArtefacto(personaje){
		return minimo.max(self.efectoLucha())
	}
	method efectoLucha(){
		return (global.fuerzaOscura() / 2) * indice
	}
}

object armadura{
	var luchaBase = 2
	var refuerzo = ninguno
	
	method luchaBase(){return luchaBase}
	method refuerzo(){return refuerzo}
	
	method refuerzo(nuevoRefuerzo){
		refuerzo = nuevoRefuerzo
	}
	method luchaArtefacto(personaje){
		return self.aplicarRefuerzo(self.luchaBase(), personaje)
	}
	method aplicarRefuerzo(base, personaje){
		return base + refuerzo.beneficioRefuerzo(personaje)
	}	
}

object espejo{
	method luchaArtefacto(personaje){
		if(self.tieneSoloEspejo(personaje)){
			return 0
		}
		else{
			personaje.quitarArtefacto(self)
			var puntosLuchaMejorArtefacto = personaje.mejorArtefactoLucha().luchaArtefacto(personaje)
			personaje.agregarArtefacto(self)
			return puntosLuchaMejorArtefacto
		}
	}
	method tieneSoloEspejo(personaje){
		return personaje.artefactos().contains(self) and personaje.artefactos().size() == 1
	}
}
