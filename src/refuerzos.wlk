import artefactos.*

object ninguno inherits ArticuloParaLaVenta {
	override method precio() {
		return 2
	}

	method beneficioRefuerzo(personaje) {
		return 0
	}

	method pesoAdicionalRefuerzo() {
		return 0
	}

}

class CotaDeMalla inherits ArticuloParaLaVenta {

	var beneficioRefuerzo

	constructor(beneficioEnUnidadesDeLucha) {
		beneficioRefuerzo = beneficioEnUnidadesDeLucha
	}
	
	method pesoRefuerzo() {
		return 1
	}

	method beneficioRefuerzo(personaje) {
		return beneficioRefuerzo
	}

	method pesoAdicionalRefuerzo() {
		return 1
	}
	
	override method precio() {
		return beneficioRefuerzo / 2
	}
}

object bendicion inherits ArticuloParaLaVenta {

	method beneficioRefuerzo(personaje) {
		return personaje.nivelDeHechiceria()
	}


	method pesoAdicionalRefuerzo() {
		return 0
	}

}

object hechizo inherits ArticuloParaLaVenta {

	var property hechizoRefuerzo = null

	method beneficioRefuerzo(personaje) {
		return hechizoRefuerzo.poder()
	}
	
	method pesoAdicionalRefuerzo() {
		if (hechizoRefuerzo.poder().even()) 
			return 2
		else return 1
	}
	
	override method precio() {
		return hechizoRefuerzo.precio()
	}

}

