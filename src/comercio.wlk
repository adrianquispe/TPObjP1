import hechizos.*
import artefactos.*
import main.*
import refuerzos.*
class Comerciante{
	var tipoComerciante
	var comision
	var minimoNoImponible = 5
	var valor 
	var aux
	constructor(tipoComercio,unaComision){
		tipoComerciante = tipoComercio
		comision = unaComision
	}
	method comision(){
		return comision
	}
	method minimoNoImponible(){
		return minimoNoImponible
	}
	method agregarImpuesto(){
		valor = tipoComerciante.impuesto(valor,self)  
	}
	method venderHechizo(personaje,hechizo){
		aux=hechizo.poder()	
		valor = hechizo.poder() - hechizo.poder().min(personaje.hechizoPreferido().poder()/2) //descuento
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
		personaje.nuevoHechizoPreferido(hechizo)
		personaje.transaccion(valor)}
			
	}
	method valorHechizo(hechizo){
			return hechizo.poder()
		}
	

	method venderArma(personaje,arma){
		valor = arma.peso()*5
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(arma)
			personaje.transaccion(valor)
		}
	}
	
	method venderCollar(personaje, cantPerlas){
		valor = 2*cantPerlas
		self.agregarImpuesto()
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
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(armadura)
			personaje.transaccion(valor)
		}
	}
	
	method venderEspejo(personaje){
		valor = 90
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(espejo)
			personaje.transaccion(valor)
		}
	}
	method venderLibroHechiceria(personaje){
		aux = libroDeHechizos.hechizos().filter({hechizosPoderosos => hechizosPoderosos.hechizoPoderoso()}).map({sumaDeHechizos => sumaDeHechizos.poder()}).sum()	
		valor = (aux + libroDeHechizos.hechizos().size()*10) - (self.valorHechizo(personaje.hechizoPreferido())/2)
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(libroDeHechizos)
			personaje.transaccion(valor)
		}
	}
	method venderMascara(personaje,mascara){
		valor = mascara.indiceDeOscuridad()*10
		self.agregarImpuesto()
		if(personaje.puedoCostear(valor)){
			personaje.agregarArtefacto(mascara)
			personaje.transaccion(valor)
		}
	}
	method situacionImpositiva(){
		if(tipoComerciante == independiente){
			comision = comision*2
			if(comision > 21){
				tipoComerciante = registrado
			}
		}else {
			if(tipoComerciante == registrado){
				tipoComerciante = impuestoALaGanancia
			}
		}
	}
}

object independiente{
	method impuesto(valor,comerciante){
		return valor+valor*(comerciante.comision()/100)
	}
}
object registrado{
	method impuesto(valor,comerciante){
		return valor*1.21
	}
}
object impuestoALaGanancia{
	method impuesto(valor,comerciante){
		if(valor<comerciante.minimoNoImponible()){
			return valor
		} else {return valor+((valor-comerciante.minimoNoImponible())*0.35)}
	}
}
