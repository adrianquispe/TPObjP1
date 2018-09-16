import hechizos.*
import artefactos.*
import global.*
import refuerzos.*

object rolando{
	var valorBase = 3
	var hechizoPreferido = espectroMalefico
	var habilidadDeLuchaBase = 1
	var artefactos = [espadaDelDestino,collarDivino,mascaraOscura]
	//var artefactos = [espadaDelDestino,collarDivino,mascaraOscura,armadura,espejo]
	
	// getters
	method valorBase(){return valorBase}
	method hechizoPreferido(){return hechizoPreferido}
	method habilidadDeLuchaBase(){return habilidadDeLuchaBase}
	method artefactos(){return artefactos}
	// fin getters

	method nivelDeHechiceria (){
		return valorBase * hechizoPreferido.poder() + global.fuerzaOscura()
	}
	method hechizoPreferido(nuevoHechizo){
		hechizoPreferido = nuevoHechizo
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
	method habilidadDeLuchaBase(nuevaHabilidad){
		habilidadDeLuchaBase = nuevaHabilidad
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

