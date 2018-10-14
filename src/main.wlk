import hechizos.*
import artefactos.*
import global.*
import refuerzos.*

class Jugador{
	var valorBase = 3
	var property hechizoPreferido
	var property habilidadDeLuchaBase
	var artefactos
	
	constructor (unHechizoPref, unaHabLuchaBase, listaArtefactos){
		hechizoPreferido = unHechizoPref
		habilidadDeLuchaBase = unaHabLuchaBase
		artefactos = listaArtefactos
	}
	
	// getters
	method valorBase(){return valorBase}
	method artefactos(){return artefactos}
	// fin getters

	method nivelDeHechiceria (){
		return valorBase * hechizoPreferido.poder() + global.fuerzaOscura()
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
	method habilidadDeLucha(personaje){
		return artefactos.fold(self.habilidadDeLuchaBase(), {lucha, artefacto => lucha + artefacto.luchaArtefacto(personaje)})
	}
	method habilidadDeLucha(){
		return self.habilidadDeLucha(self)
	}
	method masLuchaQueHechizo(){
		return self.habilidadDeLucha() > self.nivelDeHechiceria()
	}
	method mejorArtefactoLucha(){
		return artefactos.max({artefacto => artefacto.luchaArtefacto(self)})
	}
	method estaCargado(){
		return artefactos.size() >= 5
	}
	method quitarTodosLosArtefactos(){
		artefactos = []
	}
}

