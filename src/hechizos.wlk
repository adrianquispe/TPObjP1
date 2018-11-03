import global.*
import main.*
import artefactos.*

class Logo inherits ArticuloParaLaVenta { //ArticuloParaLaVenta está en artefactos

	var property nombre
	var multiplicador

	constructor(unNombre, unMulti) {
		nombre = unNombre
		multiplicador = unMulti
	}

	method poder() {
		return nombre.size() * multiplicador
	}

	method hechizoPoderoso() {
		return self.poder() > 15
	}

	override method precio() {
		return self.poder()
	}

}

object hechizoComercial inherits Logo("el hechizo comercial", 2) {

	var porcentaje = 0.2

	method porcentaje(unPorcentaje) {
		porcentaje = unPorcentaje
	}

	method multiplicador(unMulti) {
		multiplicador = unMulti
	}

	override method poder() {
		return multiplicador * nombre.size() * porcentaje
	}

}

object hechizoBasico inherits ArticuloParaLaVenta {

	method poder() {
		return 10
	}

	method hechizoPoderoso() {
		return false
	}

	override method precio() {
		return self.poder()
	}
}

object libroDeHechizos inherits ArticuloParaLaVenta {

	var hechizos = [ hechizoBasico ]
	var property fechaDeCompra = null

	method hechizos() {
		return hechizos
	}

	method hechizos(listaHechizos) {
		hechizos = listaHechizos
	}

	method poder() {
		return self.hechizosPoderosos().sum({ hechizo => hechizo.poder() })
	}

	method hechizosPoderosos() {
		return hechizos.filter{ hechizo => hechizo.hechizoPoderoso() }
	}

	// en caso de que sea hechizo poderoso no entra en bucle, sino que al intentar
	// re-llamarse recibe un "libroDeHechizos" sin argumentos
	method hechizoPoderoso() {
		return false
	}

	method pesoTotalArtefacto() {
		return 0
	}
	
	override method precio() {
		return 10 * hechizos.size() + self.poder() //El poder es la suma del poder de los hechizos poderosos
	}

}

