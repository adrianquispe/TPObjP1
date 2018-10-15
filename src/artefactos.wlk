import global.*
import refuerzos.*

class Arma {

	method luchaArtefacto(personaje) {
		return 3
	}

}

object collarDivino {

	var perlas = 5

	method modificarPerlas(nuevasPerlas) {
		perlas = nuevasPerlas
	}

	method luchaArtefacto(personaje) {
		return perlas
	}

}

class Mascara {

	var indice
	var property minimo = 4

	constructor(unIndice) {
		indice = unIndice
	}

	method luchaArtefacto(personaje) {
		return minimo.max(self.efectoLucha())
	}

	method efectoLucha() {
		return (global.fuerzaOscura() / 2) * indice
	}

}

class Armadura {

	var luchaBase
	var refuerzo

	constructor(unValorBase, unRefuerzo) {
		luchaBase = unValorBase
		refuerzo = unRefuerzo
	}

	method luchaBase() {
		return luchaBase
	}

	method refuerzo() {
		return refuerzo
	}

	method refuerzo(nuevoRefuerzo) {
		refuerzo = nuevoRefuerzo
	}

	method luchaArtefacto(personaje) {
		return self.aplicarRefuerzo(self.luchaBase(), personaje)
	}

	method aplicarRefuerzo(base, personaje) {
		return base + refuerzo.beneficioRefuerzo(personaje)
	}

}

/*Todos los personajes pueden tener espejos, que tienen el
 * mismo comportamiento. Es innecesario instanciar una 
 * clase "Espejo" o "Libro de hechizos", para que hayan muchos espejos, si nada 
 * va a ser diferente entre ellos
 */
object espejo {

	method luchaArtefacto(personaje) {
		if (personaje.tieneSoloEspejo()) {
			return 0
		} else {
			return personaje.mejorArtefactoLucha().luchaArtefacto(personaje)
		}
	}

}

