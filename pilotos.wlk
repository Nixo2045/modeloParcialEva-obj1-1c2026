import evas.*
import cuartel.*

object asuka {
    var puntosDeEntrenamiento = 5
    var ultimoEvaSincronizado = eva00

    method efectoDeSincroCon(eva) { 
        ultimoEvaSincronizado = eva 
        puntosDeEntrenamiento += eva.puntosQueOtorga()
    }
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self)
    method estaSatisfecho() = ultimoEvaSincronizado.fuerzaAT() > 2115
}

object shinji {
    var puntosDeEntrenamiento = 2
    var estaCansado = false
    const evasSincronizados = []

    method efectoDeSincroCon(eva) { 
        puntosDeEntrenamiento += eva.puntosQueOtorga()
        estaCansado = true
        evasSincronizados.add(eva)
    }
    method descansar() { estaCansado = false }
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and !estaCansado
    method estaSatisfecho() = nerv.evas().all({ p => evasSincronizados.contains(p) })
}

object rei {
    var puntosDeEntrenamiento = 0
    var cantidadSincros = 0

    method efectoDeSincroCon(eva) { 
        puntosDeEntrenamiento += eva.puntosQueOtorga()
        cantidadSincros += 1
    }
    method puedeSincronizarCon(eva) = eva.puedeSincronizarCon(self) and eva.fuerzaAT() >= 2110 and cantidadSincros > 5
    method estaSatisfecho() = cantidadSincros > 0
}