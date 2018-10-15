import hechizos.*
import artefactos.*
import main.*
import refuerzos.*
object comercio{
	var valor
	var aux
	method venderHechizo(personaje,hechizo){
		aux=hechizo.poder()	
		valor = hechizo.poder() - hechizo.poder().min(personaje.hechizoPreferido().poder()/2) //descuento
		if(personaje.puedoCostear(valor)){
		personaje.nuevoHechizoPreferido(hechizo)
		personaje.transaccion(valor)}
			
	}
	method valorHechizo(hechizo){
			return hechizo.poder()
		}
	

	method venderArma(personaje,arma){
		valor = arma.luchaArtefacto(personaje)*5
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(arma)
			personaje.transaccion(valor)
		}
	}
	
	method venderCollar(personaje, cantPerlas){
		valor = 2*cantPerlas
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(collarDivino)
			collarDivino.modificarPerlas(cantPerlas)
			personaje.transaccion(valor)
		}
	}
	
	method venderArmadura(personaje,armadura){
		if(armadura.refuerzo() == ninguno){
			valor = 2
		}else{
		if(armadura.refuerzo() == bendicion){
			valor = armadura.luchaBase()
		}else{
		if(armadura.refuerzo() == hechizo){
			valor = armadura.luchaBase()+self.valorHechizo(hechizo.hechizoRefuerzo())
		}else{
			valor = armadura.refuerzo().beneficioRefuerzo(personaje)/2
		}}}
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(armadura)
			personaje.transaccion(valor)
		}
	}
	
	method venderEspejo(personaje){
		valor = 90
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(espejo)
			personaje.transaccion(valor)
		}
	}
	method venderLibroHechiceria(personaje){
		aux = libroDeHechizos.hechizos().filter({hechizosPoderosos => hechizosPoderosos.hechizoPoderoso()}).map({sumaDeHechizos => sumaDeHechizos.poder()}).sum()	
		valor = (aux + libroDeHechizos.hechizos().size()*10) - (self.valorHechizo(personaje.hechizoPreferido())/2)
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(libroDeHechizos)
			personaje.transaccion(valor)
		}
	}
}