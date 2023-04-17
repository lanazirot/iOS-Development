//
//  Bombo.swift
//  P2-Sorteo Qatar
//
//  Created by Alan Castro on 11/04/23.
//

import Foundation

class Bombo {
    var nombre: String
    var paises: [Pais]
    
    init(nombre: String, paises: [Pais]) {
        self.nombre = nombre
        self.paises = paises
    }

    func obtenerPaisAleatorio() -> Pais {
        let indice = Int.random(in: 0..<paises.count)
        return paises[indice]
    }
}
