import aparatos.*

class Pasientes{
  const property edad = null
  var dolor = null
  var fortaleza = null
  const rutina = []

  method dolor() = dolor

  method fortaleza() = fortaleza

  method disminuirDolor(num) {dolor = dolor-num.max(0)}

  method aumentarFortaleza(num) {fortaleza += num}

  method puedeUsar(aparato) = aparato.puedeUsarsePor(self)

  method usarAparato(unAparato){
    //if (self.puedeUsar(unAparato)) lo saque para q no pregunte 2 veces al hacer la rutina
    unAparato.serUsado(self)
  }

  method puedeHacerRutina() = rutina.all({x=>self.puedeUsar(x)})

  method hacerRutina() {
    if(self.puedeHacerRutina())

      rutina.forEach({x=> self.usarAparato(x)})
  }

}

class PasienteResistente inherits Pasientes{
  override method hacerRutina() {
    super()
    fortaleza += rutina.size()
  }
}

class PasienteCaprichoso inherits Pasientes{

  override  method puedeHacerRutina() = super() and rutina.any({x=>x.color() == "rojo"})

  override method hacerRutina() {
    super()
    rutina.forEach({x=> self.usarAparato(x)})
  }
}


class PasienteDeRapidaRecuperacion inherits Pasientes{

  const valorDeRecuperacion =  3

  override method hacerRutina() {
    super()
    self.disminuirDolor(valorDeRecuperacion)
  }

}