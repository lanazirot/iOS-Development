//
//  Autobus.swift
//  Examen Unidad 1
//
//  Created by Alan Peña on 06/04/23.
//

import Foundation

class Autobus : Vehiculo {
    private var _kmInicial: Int
    private var _kmFinal: Int

    var KmInicial : Int {
        get {
            return _kmInicial
        }
        set {
            _kmInicial = newValue
        }
    }

    var KmFinal : Int {
        get {
            return _kmFinal
        }

        set {
            _kmFinal = newValue
        }
    }

    override init () {
        self._kmInicial = 0
        self._kmFinal = 0
    }

    override func calcularImporte() -> Double {
        return Double(KmFinal - KmInicial) * Tarifa
    }
}
