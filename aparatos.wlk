import pasientes.*

class Magneto{
    const property color = "blanco"
    var imantacion = 800

    method serUsado(pasinete) {
        pasinete.disminuirDolor(pasinete.dolor()*0.1)
        imantacion = imantacion-1.max(0)
    }

    method puedeUsarsePor(pasiente) = true

    method nececitaMantenimineto() = imantacion < 100

    method hacerMantenimiento() {imantacion += 500}

}

class Bicicleta{
    const property color = "blanco"
    var tornillosDesajustados = 0
    var perdidasDeAceite = 0



    method serUsado(pasiente) {
        tornillosDesajustados += if (pasiente.dolor() > 30) 1 else 0
        perdidasDeAceite += if (pasiente.edad().between(30,20)) 1 else 0
        pasiente.disminuirDolor(4)
        pasiente.aumentarFortaleza(3)
    }

    method puedeUsarsePor(pasiente) = pasiente.edad() > 8

    method nececitaMantenimineto() = tornillosDesajustados >= 10 or perdidasDeAceite >= 5

    method hacerMantenimiento() {tornillosDesajustados = 0 perdidasDeAceite = 0}
}

class Minitramp{
    const property color = "blanco"

    method serUsado(pasiente) {
        pasiente.aumentarFortaleza(pasiente.edad()*0.1)
    }

     method puedeUsarsePor(pasiente) = pasiente.dolor() < 20

     method nececitaMantenimineto() = false

     method hacerMantenimiento() {}
}