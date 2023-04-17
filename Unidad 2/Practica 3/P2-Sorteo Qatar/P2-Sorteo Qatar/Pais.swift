//
//  Pais.swift
//  P2-Sorteo Qatar
//
//  Created by Alan Castro on 10/04/23.
//

import Foundation

class Pais {
    var nombre: String
    //Las confederaciones son
    //1 - Concacaf
    //2 - Africa
    //3 - Asia/Resto mundo
    //4 - Conmebol
    //5 - Europeo
    var confederacion: Int
    
    var bandera: String
    
    init(nombre: String, confederacion: Int, bandera: String) {
        self.nombre = nombre
        self.confederacion = confederacion
        self.bandera = bandera
    }
}
