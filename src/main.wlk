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

	method oro(nuevoValor) {
		oro = nuevoValor
	}
	
	
	method comprarHechizo (hechizo, vendedor) {
		self.pagar( 0.max( hechizo.precioDeVentaSegunComerciante(vendedor) - hechizoPreferido.precio()/2 ) )
		hechizoPreferido = hechizo
	}
	
	method comprarArtefacto(nuevoArtefacto, vendedor) {
		if ( self.puedeSoportarElPeso(nuevoArtefacto) ) {
			self.pagar(nuevoArtefacto.precioDeVentaSegunComerciante(vendedor))
			nuevoArtefacto.fechaDeCompra(new Date())
			artefactos.add(nuevoArtefacto)
		}
		else throw new Exception("Es imposible equipar este artefacto")
	}

	method pagar(costo) {
		if (self.puedeCostear(costo))
		oro -= costo
		else self.error("No hay oro suficiente para pagar")
	}

	method puedeCostear(costo) {
		return oro >= costo
	}
	
	method puedeSoportarElPeso(nuevoArtefacto) {
		return self.pesoTotalEquipado() + nuevoArtefacto.pesoTotalArtefacto() < capacidadPeso
	}
	
	method agregarArtefacto(nuevoArtefacto) {
		artefactos.add(nuevoArtefacto)
}

	method pesoTotalEquipado() {
		return artefactos.sum({ artefacto => artefacto.pesoTotalArtefacto() })
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

