//
//  Orden.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Orden : Equatable {
    
    static func == (lhs: Orden, rhs: Orden) -> Bool {
        return lhs.Alimento.Nombre == rhs.Alimento.Nombre
    }
    
    private var alimento: Alimento
    private var cantidad: Int

    public var Alimento: Alimento {
        get {
            return alimento
        }
        set {
            alimento = newValue
        }
    }

    public var Cantidad: Int {
        get {
            return cantidad
        }
        set {
            cantidad = newValue
        }
    }


    init(alimento:Alimento, cantidad:Int) {
        self.alimento = alimento
        self.cantidad = cantidad
    }

    public func obtenerSubTotal() -> Double {
        return alimento.Precio * Double(cantidad)
    }

    public func toString() -> String {
        return "\(alimento.Nombre): \(cantidad)"
    }
}

