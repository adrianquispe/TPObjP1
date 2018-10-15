object ninguno{
	method beneficioRefuerzo(personaje){
		return 0
	}
}

class CotaDeMalla{
	var beneficioRefuerzo
	constructor(beneficioEnUnidadesDeLucha){
		beneficioRefuerzo = beneficioEnUnidadesDeLucha
	}
	method beneficioRefuerzo(personaje){
		return beneficioRefuerzo
	}
}

object bendicion{
	method beneficioRefuerzo(personaje){
		return personaje.nivelDeHechiceria()
	}
}

object hechizo{
	var hechizoRefuerzo
	
	method hechizoRefuerzo(hechizoAReforzar){
		hechizoRefuerzo = hechizoAReforzar
	}
	
	method beneficioRefuerzo(personaje){
		return hechizoRefuerzo.poder()
	}
}