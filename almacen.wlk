object almacen {
  const property cosas = #{}
  const property maximoBultos = 3

  method dejar(cosasDeCamion) {
    self.validarDejar(cosasDeCamion)
    cosas.addAll(cosasDeCamion)

  }

  method agregar(cosa) {
    cosas.add(cosa)
  }
  method condicionDeDestino(vehiculo) {
    return  vehiculo.totalBultos() + self.totalBultos() <= self.maximoBultos()
  }
  method totalBultos() {
		return cosas.sum({cosa => cosa.bultos()}) 
	}

    method validarDejar(cosasDeCamion) {
      if (not self.condicionDeDejar(cosasDeCamion)) {
        self.error("No se puede dejar todas las cosas del camion")
      }
    }

    method condicionDeDejar(cosasDeCamion) {
      return self.totalBultos() + self.totalBultosDe(cosasDeCamion) < self.maximoBultos()
    }
    method totalBultosDe(cosasDeCamion) {
      return cosasDeCamion.sum({cosa => cosa.bultos()})
    }
}