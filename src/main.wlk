import hechizos.*
import artefactos.*
import global.*
import refuerzos.*

class Jugador{

	var property hechizoPreferido
	var property habilidadDeLuchaBase
	var artefactos
	var oro = 100
	
	constructor (unHechizoPref, unaHabLuchaBase, listaArtefactos){
		hechizoPreferido = unHechizoPref
		habilidadDeLuchaBase = unaHabLuchaBase
		artefactos = listaArtefactos
	}
	
	// getters
	method artefactos(){return artefactos}
	method oro(){return oro}
	// fin getters

	method nivelDeHechiceria (){
		return 3 * hechizoPreferido.poder() + global.fuerzaOscura()
	}
	method esPoderoso(){
		return hechizoPreferido.hechizoPoderoso()
	}
	method agregarArtefacto(nuevoArtefacto){
		artefactos.add(nuevoArtefacto)
	}
	method quitarArtefacto(artefactoAQuitar){
		artefactos.remove(artefactoAQuitar)
	}
	method aumentarLucha(cantidad){
		habilidadDeLuchaBase += cantidad
	}
	method habilidadDeLucha(){
		return artefactos.fold(habilidadDeLuchaBase, {lucha, artefacto => lucha + artefacto.luchaArtefacto(self)})
	}

	method masLuchaQueHechizo(){
		return self.habilidadDeLucha() > self.nivelDeHechiceria()
	}
	method mejorArtefactoLucha(){
		return self.artefactosSinEspejo().max({artefacto => artefacto.luchaArtefacto(self)})
	}
	method estaCargado(){
		return artefactos.size() >= 5
	}
	method quitarTodosLosArtefactos(){
		artefactos = []
	}
	method artefactosSinEspejo(){
		return artefactos.filter({artefacto => artefacto != espejo})
	}
		method tieneSoloEspejo(){
		return artefactos.contains(espejo) && artefactos.size() == 1
	}
	method nuevoHechizoPreferido(hechizo){
		hechizoPreferido=hechizo
	}
	method oro(nuevoValor){
		oro=nuevoValor
	}
	method transaccion(costo){
		oro -= costo
	}
	method puedoCostear(costo){
		return oro>=costo
	}
}

