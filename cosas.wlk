object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var property transformacion = camion
  method peso() { return 800 transformacion.nivelPeligrosidad()}
  method nivelPeligrosidad() {return }
}
object auto {
  method nivelPeligrosidad() { return 15 }
}

object robot {
  method nivelPeligrosidad() { return 30 }
}
object paqueteDeLadrillos{
  var property cantidad = 0
	method peso() {return 2*cantidad}
	method nivelPeligrosidad() {return 2}
}

object arenaAGranel {
  var property peso = 0
	method nivelPeligrosidad() { return 1}
}

object bateriaAntiaerea {
	var estaConMisiles = false
  method peso() {
	if (estaConMisiles){
		return 300
	}
	return 200
  }

  method estaConMisiles(bool) {
	estaConMisiles = bool
  }

  method nivelPeligrosidad() {
	if (estaConMisiles){
		return 100
	}
	return 0
  }
}

object contenedorPortuario {
  const cosas = #{}

  method peso() {
	return cosas.sum({cosa => cosa.peso()}) + 100 
  }

  method nivelPeligrosidad() {
	if (cosas.isEmpty()){
		return 0
	}
	return cosas.max({ cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
  }
}

object residuosRadioactivos {
	var property peso = 0

	method nivelPeligrosidad() {return 200}
}

object embalajeDeSeguridad {
  const envoltura = #{}

  method peso() {
	return envoltura.sum({ cosa => cosa.peso()})
  }

  method nivelPeligrosidad() {
	return envoltura.sum({cosa => cosa.nivelPeligrosidad()}) / 2
  }
}

