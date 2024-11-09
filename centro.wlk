import pasientes.*
import aparatos.*

object centro {
  const pasientes = []
  const aparatos = []

  method agregarAparato(unAparato) = aparatos.add(unAparato)

  method agregarPasiente(unPasiente) = pasientes.add(unPasiente)

  method colores() = aparatos.map({x=>x.color()}).asSet()

  method pasientesMenoresDe6() = pasientes.filter({x=>x.edad() < 8})

  method pasientesSinRutina() = pasientes.filter({x=> not x.puedeHacerRutina()}) 

  method estaEnOptimasCondiciones() = aparatos.all({x=> not x.nececitaMantenimineto()})

  method estaComplicado() = aparatos.count({x=> x.nececitaMantenimineto()}) >= aparatos.size()/2

  method visitaDeTecnico() {
    aparatos.filter({x=>x.nececitaMantenimineto()}).forEach({x=>x.hacerMantenimiento()})
  }
}
