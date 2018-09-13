object global{
	var fuerzaOscura = 5
	
	method fuerzaOscura(){
		return fuerzaOscura
	}
	method fuerzaOscura(nuevaFuerza){
		fuerzaOscura = nuevaFuerza
	}
	method eclipse(){
		self.fuerzaOscura(self.fuerzaOscura() * 2)
	}	
}