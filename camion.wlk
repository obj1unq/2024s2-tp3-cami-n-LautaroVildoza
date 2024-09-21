import cosas.*
import almacen.*
import destinos.*


object camion {
	const property cosas = #{}
	var property ruta = ruta9
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.consecuencia()
	}

	method descargar(cosa) {
	  cosas.remove(cosa)
	}

	method todoPesoPar() {
	  return cosas.all({cosa => cosa.peso().even() })
	}

	method hayAlgunoQuePesa(peso) {
	  return cosas.any({cosa => cosa.peso() == peso})
	}
	method elDeNivel(nivel) {
	  return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method pesoTotal() {
	  return cosas.sum({cosa => cosa.peso()}) + 1000
	}
	method excedidoDePeso() {
	  return self.pesoTotal() > 2500
	}
	method objetosQueSuperanPeligrosidad(nivel) {
	  return cosas.filter({cosa => cosa.nivelPeligrosidad() >= nivel})
	}
	method objetosMasPeligrososQue(cosa) {
	  return cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		 return not self.excedidoDePeso() and self.cosasNoSuperanElnivelDePeligrosidad(nivelMaximoPeligrosidad) and ruta.nivelPeligrosidad() <= nivelMaximoPeligrosidad
	}
	method cosasNoSuperanElnivelDePeligrosidad(nivelMaximoPeligrosidad) {
	  return cosas.all({cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad}) 
	}

	method tieneAlgoQuePesaEntre(min, max) {
	  return  cosas.any({cosa => cosa.peso() <= max and cosa.peso() >= min})
	}

	method cosaMasPesada() {
	  return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
	  return cosas.map(({cosa => cosa.peso()}))
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()})
	}

	method transportar(destino, camino) {
		self.validarTransporte(destino, camino)
	  	destino.dejar(cosas)
		cosas.clear()
	}

	method validarTransporte(destino, camino){
		if( not self.excedidoDePeso() and not self.condicionDeDestino(destino) and not self.condicionDeCamino(camino)){
			self.error("No se puede realizar el transporte")
	  }
	}

	method condicionDeDestino(destino) { 
	  	return self.totalBultos() + destino.totalBultos() <= destino.maximoBultos()
	}

	method condicionDeCamino(camino) {
		return self.puedeCircularEnRuta(camino.nivelPeligrosidad()) or self.pesoTotal() < camino.pesoMaximo()
	}
}
