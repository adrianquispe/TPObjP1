object ninguno{
	method beneficioRefuerzo(personaje){
		return 0
	}
	method hechizoRefuerzo(){}
	method pesoAdicional(){return 0}
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
	method pesoAdicional(){return 1}
}

object bendicion{
	method beneficioRefuerzo(personaje){
		return personaje.nivelDeHechiceria()
	}
	method hechizoRefuerzo(){}
	method pesoAdicional(){return 0}
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
	method pesoAdicional(){
		if(hechizoRefuerzo.poder().even()){
			return 2
		} else {return 1}
	}
}
