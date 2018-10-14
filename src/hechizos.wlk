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

object hechizoBasico{
	
	method poder(){
		return 10
	}
	method hechizoPoderoso(){
		return false
	}
}

object libroDeHechizos{
	var hechizos = [hechizoBasico, espectroMalefico]
	
	method hechizos(){return hechizos}
	method hechizos(listaHechizos){
		hechizos = listaHechizos
	}
	
	method poder(){
		return self.hechizosPoderosos(self.hechizos()).sum({hechizo => hechizo.poder()})
	}
	method hechizosPoderosos(listaHechizos){
		return listaHechizos.filter{hechizo => hechizo.hechizoPoderoso()}
	}
	//en caso de que sea hechizo poderoso no entra en bucle, sino que al intentar
	//re-llamarse recibe un "libroDeHechizos" sin argumentos
	method hechizoPoderoso(){
		return false
	}
}