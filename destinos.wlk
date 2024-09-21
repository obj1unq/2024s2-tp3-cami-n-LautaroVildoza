object ruta9 {
  method nivelPeligrosidad() {return 11}
  method pesoMaximo() {return 0} //para respetar el polimorismo
}

object caminosVecinales {
    var property pesoMaximo = 0
    method nivelPeligrosidad() {return 0} //para respetar el polimorfismo
}
