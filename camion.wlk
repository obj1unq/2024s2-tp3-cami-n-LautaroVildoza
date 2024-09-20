import cosas.*

object camion {
	const property cosas = #{}
	
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
		 return not self.excedidoDePeso() and self.cosasNoSuperanElnivelDePeligrosidad(nivelMaximoPeligrosidad)
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

}
