import global.*
import refuerzos.*

object espadaDelDestino{
	method luchaArtefacto(personaje){
		return 3
	}
}

class ArmaDeFilo {
	method luchaArtefacto(personaje){
		return 3
	}
}


object collarDivino{
	var perlas
	
	method modificarPerlas(nuevasPerlas){
		perlas = nuevasPerlas
	}
	method luchaArtefacto(personaje){
		return perlas
	}
}

class Mascara {
	var indiceDeOscuridad
	constructor(valor){
		indiceDeOscuridad=valor
	}
	method luchaArtefacto(personaje){
		return self.efectoLucha()
	}
	method efectoLucha(){
		return 4.max((global.fuerzaOscura() / 2)*indiceDeOscuridad)
	}
}

object mascaraOscura{
	method luchaArtefacto(personaje){
		return self.efectoLucha()
	}
	method efectoLucha(){
		return 4.max(global.fuerzaOscura() / 2)
	}
}

class Armadura{
	var luchaBase
	var refuerzo = ninguno
	constructor(valorLucha){
		luchaBase = valorLucha
	}
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
		if(personaje.tieneSoloEspejo()){
			return 0
		}
		else{
			personaje.quitarArtefacto(self)
			var puntosLuchaMejorArtefacto = personaje.mejorArtefactoLucha().luchaArtefacto(personaje)
			personaje.agregarArtefacto(self)
			return puntosLuchaMejorArtefacto
		}
	}
}
