import global.*

object  espectroMalefico{
	var nombre = "Espectro Malefico"
	
	method poder(){
		return nombre.size()
	}
	method hechizoPoderoso(){
		return self.poder() > 15
	}
	method nombre(){
		return nombre
	}
	method nombre(nuevoNombre){
		nombre = nuevoNombre
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