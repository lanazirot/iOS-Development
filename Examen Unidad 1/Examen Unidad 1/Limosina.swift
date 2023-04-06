//
//  Limosina.swift
//  Examen Unidad 1
//
//  Created by Alan Peña on 06/04/23.
//

import Foundation

class Limosina : Vehiculo {
    private var _diasTotales: Int

    var DiasTotales : Int {
        get {
            return _diasTotales
        }
        set {
            _diasTotales = newValue
        }
    }

    override init () {
        self._diasTotales = 0
    }

    override func calcularImporte() -> Double {
        return Double(DiasTotales) * Tarifa
    }
}
