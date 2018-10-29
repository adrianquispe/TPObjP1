import global.*
import refuerzos.*
import main.*

class Arma {
	var peso
	var fechaCompra
	constructor(unpeso, unafecha){
		peso = unpeso
		fechaCompra = unafecha
	}
	method luchaArtefacto(personaje) {
		return 3
	}
	method pesoAdicional(){
		return 0
	}
	method peso(){
		return peso
	}
	method pesoTotalArtefacto(){
		return medidor.pesoArtefacto(self)
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
}

object collarDivino {

	var perlas = 5
	var peso = 5
	var fechaCompra = fechaActual.fecha()
	method modificarPerlas(nuevasPerlas) {
		perlas = nuevasPerlas
	}

	method luchaArtefacto(personaje) {
		return perlas
	}
	method peso(valor){
		peso = valor
	}
	method peso(){
		return peso
	}
	method pesoAdicional(){
		return -perlas*0.5
	}
	method pesoTotalArtefacto(){
		return medidor.pesoArtefacto(self)
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
}

class Mascara {

	var indice
	var property minimo = 4
	var peso
	var fechaCompra=fechaActual.fecha()
	constructor(unIndice, unPeso) {
		indice = unIndice
		peso = unPeso
	}

	method luchaArtefacto(personaje) {
		return minimo.max(self.efectoLucha())
	}

	method efectoLucha() {
		return (global.fuerzaOscura() / 2) * indice
	}
	method peso(){
		return peso
	}
	method pesoAdicional(){
		if(self.efectoLucha() >= 3){
			return self.efectoLucha() - 3
		} else{return 0}
	}
	method pesoTotalArtefacto(){
		return medidor.pesoArtefacto(self)
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
}

class Armadura {

	var luchaBase
	var refuerzo
	var peso
	var fechaCompra=fechaActual.fecha()
	constructor(unValorBase, unRefuerzo, unPeso) {
		luchaBase = unValorBase
		refuerzo = unRefuerzo
		peso = unPeso
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
	method peso(){
		return peso
	}
	method pesoAdicional(){
		return refuerzo.pesoAdicional()
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}

}

/*Todos los personajes pueden tener espejos, que tienen el
 * mismo comportamiento. Es innecesario instanciar una 
 * clase "Espejo" o "Libro de hechizos", para que hayan muchos espejos, si nada 
 * va a ser diferente entre ellos
 */
object espejo {
	var peso = 5
	var fechaCompra = fechaActual.fecha()
	method luchaArtefacto(personaje) {
		if (personaje.tieneSoloEspejo()) {
			return 0
		} else {
			return personaje.mejorArtefactoLucha().luchaArtefacto(personaje)
		}
	}
	method peso(valor){
		peso=valor
	}
	method peso(){
		return peso
	}
	method pesoAdicional(){
		return 0
	}
	method pesoTotalArtefacto(personaje){
		return personaje.pesoArtefacto(self)
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
}
