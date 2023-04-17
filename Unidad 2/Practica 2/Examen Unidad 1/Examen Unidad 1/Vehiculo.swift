//
//  Vehiculo.swift
//  Examen Unidad 1
//
//  Created by Alan Peña on 06/04/23.
//

import Foundation


class Vehiculo {
    private var _placas: String
    private var _tarifa: Double

    var Placas : String {
        get {
            return _placas
        }
        set {
            _placas = newValue
        }
    }

    var Tarifa : Double {
        get {
            return _tarifa
        }
        set {
            _tarifa = newValue
        }
    }

    func calcularImporte() -> Double {
        return 0.0
    }
    //Le puse este constructor ya que el compilador me marcaba error si no lo ponia
    init () {
        self._placas = ""
        self._tarifa = 0.0
    }

}
