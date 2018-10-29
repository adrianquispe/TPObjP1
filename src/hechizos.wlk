import global.*
import main.*

class Logo {
	var property nombre
	var multiplicador
	var fechaCompra=fechaActual.fecha()
	
	constructor (unNombre, unMulti){
		nombre = unNombre
		multiplicador = unMulti
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
	method poder(){
		return nombre.size() * multiplicador
	}
	method hechizoPoderoso(){
		return self.poder() > 15
	}
	method peso(){
		return 0
	}
	method pesoAdicional(){
		return 0
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
	var fechaCompra=fechaActual.fecha()
	method poder(){
		return 10
	}
	method hechizoPoderoso(){
		return false
	}
	method peso(){
		return 0
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
	method pesoAdicional(){
		return 0
	}
}

object libroDeHechizos{
	var hechizos = [hechizoBasico]
	var fechaCompra=fechaActual.fecha()
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
	method peso(){
		return 0
	}
	method fecha(pos){
		return fechaCompra.get(pos)
	}
	method pesoAdicional(){
		return 0
	}
}
