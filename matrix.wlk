object neo {
    var energia = 100
    method esElElegido() = true

    method saltar() {
        energia = energia / 2
    }

    method vitalidad() = energia / 10
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false

    method esElElegido() = false

    method saltar() {
        estaCansado = !estaCansado
        vitalidad = (vitalidad - 1).max(0)
    }

    method vitalidad() = vitalidad
}

object trinity {
    method esElElegido() = false
    method saltar() {}
    method vitalidad() = 0
}

object nave {
    //method subirPasajero(pasajero) {
    //    pasajeros.add(pasajero)
    //}

    //method bajarPasajero(pasajero) {
    //    pasajeros.remove(pasajero)
    //}

    const pasajeros = []
    method pasajeros() = pasajeros
    method cantidadPasajeros() = pasajeros.size()
    method elPasajeroConMasVitalidad() = pasajeros.max({pasajero => pasajero.vitalidad()})
    method elPasajeroConMenorVitalidad() = pasajeros.min({pasajero => pasajero.vitalidad()})

    method estaEquilibrada() = self.elPasajeroConMasVitalidad().vitalidad() <= self.elPasajeroConMenorVitalidad().vitalidad() * 2

    method estaElElegido() = pasajeros.any({pasajero => pasajero.esElElegido()})

    method chocar() {
        pasajeros.forEach({pasajero => pasajero.saltar()})
        pasajeros.clear()
    }

    method acelerar() {
        pasajeros.filter({pasajero => not pasajero.esElElegido()}).forEach({pasajero => pasajero.saltar()})
    }
}