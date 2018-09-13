object ninguno{
	method beneficioRefuerzo(personaje){
		return 0
	}
}

object cotaDeMalla{
	method beneficioRefuerzo(personaje){
		return 1
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