import hechizos.*
import artefactos.*
import main.*
import refuerzos.*

class Comerciante {

	var tipoComerciante
	var porcentajeDeComision
	var minimoNoImponible = 5

	constructor(tipoComercio, unaComision) {
		tipoComerciante = tipoComercio
		porcentajeDeComision = unaComision
	}

	method porcentajeDeComision() {
		return porcentajeDeComision
	}

	method minimoNoImponible() {
		return minimoNoImponible
	}

	method impuestoACobrar(unValor) {
		return tipoComerciante.impuesto(unValor, self)
	}

	method situacionImpositiva() {
		if (tipoComerciante == independiente) {
			porcentajeDeComision *= 2
			if (porcentajeDeComision > 0.21) tipoComerciante = registrado
		} else if (tipoComerciante == registrado) tipoComerciante = pagaImpuestosALasGanancia
	}

}

//El valor del artefacto más el impuesto se calcula  como (precioArtefacto + impuesto)
object independiente {

	method impuesto(valor, comerciante) {
		return valor * comerciante.porcentajeDeComision()
	}

}

object registrado {

	method impuesto(valor, comerciante) {
		return valor * 0.21
	}

}

object pagaImpuestosALasGanancia {

	method impuesto(valor, comerciante) {
		if (valor < comerciante.minimoNoImponible()) 
			return 0 
		else return (valor - comerciante.minimoNoImponible()) * 0.35
	}

}

