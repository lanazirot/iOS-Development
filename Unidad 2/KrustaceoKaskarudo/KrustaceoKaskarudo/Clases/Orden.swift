//
//  Orden.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Orden {
    var alimento: AlimentoMenu
    var cantidad: Int

    init(alimento:AlimentoMenu, cantidad:Int) {
        self.alimento = alimento
        self.cantidad = cantidad
    }

    public func obtenerSubTotal() -> Double {
        return alimento.rawValue * Double(cantidad)
    }

    public func toString() -> String {
        return "\(alimento.nombre): \(cantidad)"
    }
}
