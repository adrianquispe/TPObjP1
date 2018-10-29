import hechizos.*
import artefactos.*
import global.*
import refuerzos.*

class Jugador {

	var property hechizoPreferido
	var property habilidadDeLuchaBase
	var artefactos
	var capacidadPeso
	var oro = 100

	constructor(unHechizoPref, unaHabLuchaBase, listaArtefactos, capacidadEnPeso) {
		hechizoPreferido = unHechizoPref
		habilidadDeLuchaBase = unaHabLuchaBase
		artefactos = listaArtefactos
		capacidadPeso = capacidadEnPeso
	}

	// getters
	method artefactos() {
		return artefactos
	}

	method oro() {
		return oro
	}

	// fin getters
	method nivelDeHechiceria() {
		return 3 * hechizoPreferido.poder() + global.fuerzaOscura()
	}

	method esPoderoso() {
		return hechizoPreferido.hechizoPoderoso()
	}

	method agregarArtefacto(nuevoArtefacto) {
		if (self.pesoTotalEquipado() + medidor.pesoArtefacto(nuevoArtefacto) > capacidadPeso) {
			throw new Exception("Es imposible equiparse ese artefacto")
		} else {
			artefactos.add(nuevoArtefacto)
		}
	}

	method quitarArtefacto(artefactoAQuitar) {
		artefactos.remove(artefactoAQuitar)
	}

	method aumentarLucha(cantidad) {
		habilidadDeLuchaBase += cantidad
	}

	method habilidadDeLucha() {
		return artefactos.fold(habilidadDeLuchaBase, { lucha , artefacto => lucha + artefacto.luchaArtefacto(self) })
	}

	method masLuchaQueHechizo() {
		return self.habilidadDeLucha() > self.nivelDeHechiceria()
	}

	method mejorArtefactoLucha() {
		return self.artefactosSinEspejo().max({ artefacto => artefacto.luchaArtefacto(self) })
	}

	method estaCargado() {
		return artefactos.size() >= 5
	}

	method quitarTodosLosArtefactos() {
		artefactos = []
	}

	method artefactosSinEspejo() {
		return artefactos.filter({ artefacto => artefacto != espejo })
	}

	method tieneSoloEspejo() {
		return artefactos.contains(espejo) && artefactos.size() == 1
	}

	method nuevoHechizoPreferido(hechizo) {
		hechizoPreferido = hechizo
	}

	method oro(nuevoValor) {
		oro = nuevoValor
	}

	method transaccion(costo) {
		oro -= costo
	}

	method puedoCostear(costo) {
		return oro >= costo
	}

	method pesoTotalEquipado() {
		return artefactos.map({ pesos => pesos.pesoTotalArtefacto() }).sum()
	}

}

object medidor {

	method diasCompraArtefacto(artefacto) {
		return ((fechaActual.fecha(2) - artefacto.fecha(2)) * 365) + ((fechaActual.fecha(1) - artefacto.fecha(1)) * 30) + (fechaActual.fecha(0) - artefacto.fecha(0))
	}

	method pesoArtefacto(artefacto) {
		return artefacto.peso() - 1.min(self.diasCompraArtefacto(artefacto) / 1000) + artefacto.pesoAdicional()
	}

	method pesoArtefacto(artefacto, cantDias) {
		return artefacto.peso() - 1.min(cantDias / 100) + artefacto.pesoAdicional()
	}

}

object fechaActual {

	var fecha = [ 28, 10, 2018 ]

	method fecha(pos) {
		return fecha.get(pos)
	}

	method fecha() {
		return fecha
	}

}

class NPC inherits Jugador {

	var property nivel

	constructor(unHechizoPref, unaHabLuchaBase, listaArtefactos,capacidadEnPeso, unNivel) = super(unHechizoPref, unaHabLuchaBase, listaArtefactos,capacidadEnPeso) {
		nivel = unNivel
	}

	override method habilidadDeLucha() {
		return nivel.multiplicadorDeHechiceria() * super()
	}

}

class Nivel {

	var multiplicadorDeHechiceria

	constructor(unMulti) {
		multiplicadorDeHechiceria = unMulti
	}

	method multiplicadorDeHechiceria() {
		return multiplicadorDeHechiceria
	}

}

object facil inherits Nivel(1) {

}

object moderado inherits Nivel(2) {

}

object dificil inherits Nivel(4) {

}

