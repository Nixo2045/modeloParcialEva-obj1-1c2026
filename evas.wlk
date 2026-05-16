object eva01 {
    var fuerzaAT = 2110
    var energia = 100

    method fuerzaAT() = fuerzaAT
    method energia() = energia
    method efectoDeSincroCon(unPiloto) {
        energia -= 25
        fuerzaAT = 2150.min(fuerzaAT+1)
    }
    method recargarEnergia(horas) { energia = 100.min(energia+30*horas) }
    method puedeSincronizarCon(unPiloto) = unPiloto.puntosDeEntrenamiento() >= 4 and energia > 30
    method puntosQueOtorga() = 2
}

object eva02 {
    var energia = 100
    var modoActual = estandar

    method fuerzaAT() = 2114
    method energia() = energia
    method efectoDeSincroCon(unPiloto) {
        energia -= modoActual.consumo()
    }
    method recargarEnergia(horas) { energia = 100.min(energia+25*horas) }
    method cambiarModo(nuevoModo) {modoActual = nuevoModo}
    method puedeSincronizarCon(unPiloto) = unPiloto.puntosDeEntrenamiento() >= 2 and energia > 20
    method puntosQueOtorga() = modoActual.puntosQueOtorga()
}

object estandar {
    method consumo() = 10
    method puntosQueOtorga() = 1
}

object ataque {
    method consumo() = 20
    method puntosQueOtorga() = 3
}

object bersek {
    method consumo() = 35
    method puntosQueOtorga() = 6
}

object eva00 {
    var fuerzaAT = 2100

    method fuerzaAT() = fuerzaAT
    // Fuerza debe ser >= 0
    method mejorarFuerzaAT(fuerza) { fuerzaAT = 2150.min(fuerzaAT+fuerza) } 

    method energia() {}
    method efectoDeSincroCon(unPiloto) {  }

    method puedeSincronizarCon(unPiloto) = true
    method puntosQueOtorga() = 1
}