import pilotos.*
import evas.*

object nerv {
    const evas = [eva01, eva02, eva00]
    const pilotos = [rei, shinji, asuka]
    
    method evas() = evas
    method pilotos() = pilotos

    method registrarPiloto(unPiloto) { pilotos.add(unPiloto) }
    method registrarEva(unEva) { evas.add(unEva) }
    method registrarPilotos(listaDePilotos) { pilotos.addAll(listaDePilotos) }
    method registrarEvas(listaDeEvas) { evas.addAll(listaDeEvas) }

    method echarPiloto(unPiloto) { pilotos.remove(unPiloto) }
    method echarEva(unEva) { evas.remove(unEva) }
    method echarPilotos(listaDePilotos) { pilotos.removeAll(listaDePilotos) }
    method echarEvas(listaDeEvas) { evas.removeAll(listaDeEvas) }

    method intentarSincro(eva, piloto) {
        if (self.puedenSincronizar(eva, piloto)) {
            eva.efectoDeSincroCon(piloto)
            piloto.efectoDeSincroCon(eva)
        }
        else {
            self.error("No se pudieron sincronizar")
        }
    }
    method puedenSincronizar(eva, piloto) = eva.puedeSincronizarCon(piloto) and piloto.puedeSincronizarCon(eva)
    method ordenarAPilotoSincronizarConTodos(unPiloto) {
        evas.forEach({ p => self.intentarSincro(p, unPiloto)})
    }
    method promedioPuntosDeEntrenamientoDePilotos() {return ( pilotos.sum({ p => p.puntosDeEntrenamiento()}) ) / (pilotos.size()) }
    method pilotoConMasPuntosDeEntrenamiento() = pilotos.max({ p => p.puntosDeEntrenamiento() })
    method valoresDeFuerzaATDeEvas() = evas.map({p => p.fuerzaAT()})
    method evasEnCondicionesDeUsarsePor(unPiloto) = evas.filter({ p => p.puedeSincronizarCon(unPiloto)}) 
    method todosLosPilotosPuedenSincronizar() = pilotos.all({p => self.algunEvaPuedeSincronizarCon(p) })
    method algunEvaPuedeSincronizarCon(unPiloto) = evas.any({ e => self.puedenSincronizar(e, unPiloto) })
    method estaSatisfechoElPiloto(unPiloto) = pilotos.contains(unPiloto) and unPiloto.estaSatisfecho()
}