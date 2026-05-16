object nerv {
    const evas = []
    const pilotos = []
    
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
    // El 5
    method todosLosPilotosPuedenSincronizar() = pilotos.all({p => self.algunEvaPuedeSincronizarCon(p) })
    method algunEvaPuedeSincronizarCon(unPiloto) = evas.any({ e => self.puedenSincronizar(e, unPiloto) })
}