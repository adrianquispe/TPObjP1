object ninguno{
	method beneficioRefuerzo(personaje){
		return 0
	}
	method hechizoRefuerzo(){}
}

class CotaDeMalla{
	var beneficioRefuerzo
	constructor(beneficioEnUnidadesDeLucha){
		beneficioRefuerzo = beneficioEnUnidadesDeLucha
	}
	method beneficioRefuerzo(personaje){
		return beneficioRefuerzo
	}
	method hechizoRefuerzo(){}
}

object bendicion{
	method beneficioRefuerzo(personaje){
		return personaje.nivelDeHechiceria()
	}
	method hechizoRefuerzo(){}
}

object hechizo{
	var hechizoRefuerzo
	
	method hechizoRefuerzo(hechizoAReforzar){
		hechizoRefuerzo = hechizoAReforzar
	}
	
	method beneficioRefuerzo(personaje){
		return hechizoRefuerzo.poder()
	}
	method hechizoRefuerzo(){
		return hechizoRefuerzo
	}
}
