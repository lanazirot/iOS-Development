//
//  Pedido.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Pedido {
    var mesa:Int
    var ordenes:[Orden] = []
    var tengoDescuento: Bool = false
    var propinaPorcentaje:Int = 0
    
    init(mesa: Int) {
        self.mesa = mesa
    }
    
    public func obtenerTotal() -> Double {
        var subTotal = 0
        
        //Por cada orden, ir sumando el total
        
        if tengoDescuento {
            
        }
        
        return 0
    }
}
	
