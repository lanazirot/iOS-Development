//
//  Alimento.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Alimento {
    var nombre:String
    var precio:Double
    
    init(nombre:String, precio: Double) {
        self.nombre = nombre
        self.precio = precio
    }
    
    public func toString() -> String {
        return "\(nombre) \t\t$\(precio)"
    }
}
