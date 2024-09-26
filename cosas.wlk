object knightRider {
	const property bultos = 1
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method consecuencia() {// no hace nada
	}
}

object bumblebee {
	const property bultos = 2
	var property transformacion = auto
  method peso() { return 800}
  method nivelPeligrosidad() {return transformacion.nivelPeligrosidad()}
  method consecuencia() {transformacion = robot}
}

object paqueteDeLadrillos{
  	var property ladrillos = 0
	method peso() {return 2*ladrillos}

	method nivelPeligrosidad() {return 2}

	method bultos() {
		return if(ladrillos <= 100) 1 else if (ladrillos <= 300)  2 else  3
	}

	method consecuencia() { ladrillos += 12}
}

object arenaAGranel {
	const property bultos = 1
  	var property peso = 0
	method nivelPeligrosidad() { return 1}
	method consecuencia() { peso += 20}
}

object bateriaAntiaerea {
	var property bultos = 0
	var property estaConMisiles = false
  method peso() {
	if (estaConMisiles){
		return 300
	}
	return 200
  }

  method cambiarMisilesA(bool) {
	estaConMisiles = bool
  }

  method nivelPeligrosidad() {
	return if (estaConMisiles){
		 100
	}
	else 0
  }
  method bultos() {
	return if (estaConMisiles){
		  2
	}
	  else 1
  }
  method consecuencia() { self.cambiarMisilesA(true)}

}

object contenedorPortuario {
	const property bultos = 1
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

	method agregar(cosa) {
	  cosas.add(cosa)
	}
  method bultos() {
	return cosas.sum({cosa => cosa.bultos()}) + bultos
  }
  
  method consecuencia() {cosas.forEach({cosa => cosa.consecuencia()})}
}

object residuosRadioactivos {
	const property bultos = 1
	var property peso = 0

	method nivelPeligrosidad() {return 200}
	method consecuencia() { peso += 15}
}

object embalajeDeSeguridad {
	const property bultos = 2
  	const envoltura = []

  method peso() {
	return envoltura.sum({ cosa => cosa.peso()})
  }

  method nivelPeligrosidad() {
	return envoltura.sum({cosa => cosa.nivelPeligrosidad()}) / 2
  }
  method consecuencia() { //no hace nada
  }
}

//Transformaciones
object auto {
  method nivelPeligrosidad() { return 15 }
}

object robot {
  method nivelPeligrosidad() { return 30 }
}