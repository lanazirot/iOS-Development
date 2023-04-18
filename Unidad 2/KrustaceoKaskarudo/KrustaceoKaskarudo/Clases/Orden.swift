//
//  Orden.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Orden {
    var alimento: Alimento
    var cantidad: Int

    init(alimento:Alimento, cantidad:Int) {
        self.alimento = alimento
        self.cantidad = cantidad
    }

    public func obtenerSubTotal() -> Double {
        return alimento.precio * cantidad
    }
}
