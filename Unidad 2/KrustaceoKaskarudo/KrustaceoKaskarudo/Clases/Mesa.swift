//
//  Mesa.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Mesa {
    var ordenes:[Orden] = []
    var tengoDescuento: Bool = false
    var propinaPorcentaje:Int = 0
    
    init(mesa: Int) {
        self.mesa = mesa
    }

    func obtenerPropina(subTotal:Double) -> Double {
        return subTotal * Double(propinaPorcentaje) / 100
    }

    func obtenerDescuento(subTotal:Double) -> Double {
        return tengoDescuento ? subTotal * 0.5 : 0
    }

    public func cobrarMesa() -> String {
        var mensaje:String = "Elementos consumidos: \n"
        var total:Double = 0

        //Agregamos los elementos consumidos
        for orden in ordenes {
            mensaje += "  + \(orden.toString()) \n"
            total += orden.obtenerSubTotal()
        }
        mensaje += "\nSubtotal: $\(total) \n"

        //Agregamos el valor de la propina
        let propina = obtenerPropina(subTotal: total)
        mensaje += "Propina \(propinaPorcentaje)%: $\(propina) \n"
        total += propina

        //Agregar el descuento (si tiene)
        let descuento = obtenerDescuento(subTotal: total)
        if descuento > 0 {
            mensaje += "Descuento: $\(descuento) \n"
            total -= descuento
        }

        //Agregamos el total
        mensaje += "Total a pagar: $\(total)"
        
        return mensaje
    }
}
