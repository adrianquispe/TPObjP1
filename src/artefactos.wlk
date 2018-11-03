import global.*
import refuerzos.*
import main.*
import comercio.*

//SOLO SE DESGASTAN LAS ARMAS!!! D:<

class ArticuloParaLaVenta {
	method precio() {
		return 0
	}
	
	method precioDeVentaSegunComerciante(comerciante) {
		return self.precio() + comerciante.impuestoACobrar(self.precio())
	}
}

class Arma inherits ArticuloParaLaVenta {
	
	const hoy = new Date()
	var property fechaDeCompra
	var peso
	
	constructor (unPeso, fecha) {
		peso = unPeso
		fechaDeCompra = fecha
	}
	
 override method precio(){
		return self.peso() * 5
	}
	
	method luchaArtefacto(personaje) {
		return 3
	}
	
	method diasCompraArtefacto() {
		return  hoy - fechaDeCompra
	}
	method factorDeCorreccion() {
		return (self.diasCompraArtefacto() / 1000).min(1)
	}
	
	method peso() {
		return peso
	}
	
	method pesoTotalArtefacto() {
		return peso - self.factorDeCorreccion()
	}
	
}


object collarDivino inherits ArticuloParaLaVenta  {

	var perlas = 5
	var property fechaDeCompra = null
	
	method modificarPerlas(nuevasPerlas) {
		perlas = nuevasPerlas
	}

	method luchaArtefacto(personaje) {
		return perlas
	}

	method pesoTotalArtefacto(){
		return perlas*0.5
	}
	
	override method precio() {
		return perlas * 2
	}
}

class Mascara inherits ArticuloParaLaVenta{

	var indice
	var property minimo = 4	
	var property fechaDeCompra = null
	var peso
	
	constructor(unPeso, unIndice) {
		peso = unPeso
		indice = unIndice
	}

	method luchaArtefacto(personaje) {
		return minimo.max(self.efectoLucha())
	}

	method efectoLucha() {
		return (global.fuerzaOscura() / 2) * indice
	}
	
	method pesoAdicional(){
		return 0.max(self.efectoLucha() - 3)
	}
	
	method pesoTotalArtefacto(){
		return peso + self.pesoAdicional()
	}

	method indiceDeOscuridad(){
		return indice
	}
	override method precio() {
		return 10 * indice
	}
}

class Armadura inherits ArticuloParaLaVenta {

	var luchaBase
	var refuerzo
	var peso
	var property fechaDeCompra = null
	
	constructor(unPeso, unValorBase, unRefuerzo) {
		peso = unPeso
		luchaBase = unValorBase
		refuerzo = unRefuerzo
	}

	method refuerzo(nuevoRefuerzo) {
		refuerzo = nuevoRefuerzo
	}

	method luchaArtefacto(personaje) {
		return luchaBase + refuerzo.beneficioRefuerzo(personaje)
	}

	method pesoTotalArtefacto(){
		return peso + refuerzo.pesoAdicionalRefuerzo()
	}
	
	override method precio() {
		if (refuerzo == hechizo || refuerzo == bendicion)
			return luchaBase + refuerzo.precio() //El precio de la bendición es cero
		else return refuerzo.precio() //Si el refuerzo es ninguno, el precio es 2
	}
}

/*Todos los personajes pueden tener espejos, que tienen el
 * mismo comportamiento. Es innecesario instanciar una 
 * clase "Espejo" o "Libro de hechizos", para que hayan muchos espejos, si nada 
 * va a ser diferente entre ellos
 */
object espejo inherits ArticuloParaLaVenta {
	var property pesoTotalArtefacto = 5
	var property fechaDeCompra = null
	
	method luchaArtefacto(personaje) {
		if (personaje.tieneSoloEspejo())
			return 0
		else return personaje.mejorArtefactoLucha().luchaArtefacto(personaje)
	}
	
	override method precio() {
		return 90
	}
}

