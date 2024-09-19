import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa) {
	  cosas.remove(cosa)
	}

	method todoPesoPar() {
	  cosas.all({cosa => cosa.peso().even() })
	}

	method hayAlgunoQuePesa(peso) {
	  cosas.any({cosa => cosa.peso() == peso})
	}
	method elDeNivel(nivel) {
	  cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method pesoTotal() {
	  return cosas.sum({cosa => cosa.peso()}) + 1000
	}
	method excedidoDePeso() {
	  return self.pesoTotal() > 2500
	}
	method objetosQueSuperanPeligrosidad(nivel) {
	  cosas.filter({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	method objetosMasPeligrososQue(cosa) {
	  cosas.filter({unaCosa => unaCosa.nivelPeligrosidad() > cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		 self.excedidoDePeso() and self.cosasNoSuperanElnivelDePeligrosidad(nivelMaximoPeligrosidad)
	}
	method cosasNoSuperanElnivelDePeligrosidad(nivelMaximoPeligrosidad) {
	  return cosas.all({cosa => cosa.nivelPeligrosidad() <= nivelMaximoPeligrosidad}) 
	}

	method tieneAlgoQuePesaEntre(min, max) {
	  cosas.any(min < {cosa => cosa.peso()} > max)
	}

	method cosaMasPesada() {
	  cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
	  cosas.all({cosa => cosa.precio()}).asList()
	}

	method totalBultos() {
	  return 
	}
}
