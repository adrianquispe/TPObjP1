object ninguno{
	method beneficioRefuerzo(personaje){
		return 0
	}
}

class CotaDeMalla{
	var valorRefuerzo = 1
	method nuevoRefuerzo(valor){
		valorRefuerzo = valor
	}
	method beneficioRefuerzo(personaje){
		return valorRefuerzo
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
	method hechizoRefuerzo(){return hechizoRefuerzo}
	
	method beneficioRefuerzo(personaje){
		return self.hechizoRefuerzo().poder()
	}
}
