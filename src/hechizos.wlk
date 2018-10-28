import global.*

class Logo {
	var property nombre
	var multiplicador
	
	constructor (unNombre, unMulti){
		nombre = unNombre
		multiplicador = unMulti
	}
	
	method poder(){
		return nombre.size() * multiplicador
	}
	method hechizoPoderoso(){
		return self.poder() > 15
	}
}

object hechizoComercial inherits Logo("el hechizo comercial",2)  {
	var porcentaje = 0.2
	
	method porcentaje(unPorcentaje){
		porcentaje = unPorcentaje
	}
	method multiplicador(unMulti) {
		multiplicador = unMulti
	}

override method poder(){
		return multiplicador*nombre.size()*porcentaje
	}
}


object hechizoBasico{
	
	method poder(){
		return 10
	}
	method hechizoPoderoso(){
		return false
	}
}

object libroDeHechizos{
	var hechizos = [hechizoBasico]
	
	method hechizos(){return hechizos}
	method hechizos(listaHechizos){
		hechizos = listaHechizos
	}
	
	method poder(){
		return self.hechizosPoderosos().sum({hechizo => hechizo.poder()})
	}
	method hechizosPoderosos(){
		return hechizos.filter{hechizo => hechizo.hechizoPoderoso()}
	}
	//en caso de que sea hechizo poderoso no entra en bucle, sino que al intentar
	//re-llamarse recibe un "libroDeHechizos" sin argumentos
	method hechizoPoderoso(){
		return false
	}
}