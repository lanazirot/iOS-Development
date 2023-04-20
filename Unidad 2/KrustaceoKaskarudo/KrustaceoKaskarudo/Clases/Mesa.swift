//
//  Mesa.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Mesa{
    
    private var ordenes: [Orden] = []
    private var tengoDescuento: Bool = false
    private var propinaPorcentaje: Int = 0
    private var mesa: Int = -1
    
    public var Ordenes: [Orden] {
        get {
            return ordenes
        }
    }

    public var TengoDescuento: Bool {
        get {
            return tengoDescuento
        }
        set {
            tengoDescuento = newValue
        }
    }

    public var PropinaPorcentaje: Int {
        get {
            return propinaPorcentaje
        }
        set {
            propinaPorcentaje = newValue
        }
    }

    public var Mesa: Int {
        get {
            return mesa
        }
    }


    public func agregarOrden(orden: Orden) {
        ordenes.append(orden)
    }


    private func eliminarOrden(orden: Orden) {
        ordenes.remove(at: ordenes.firstIndex(of: orden)!)
    }
    
    
    func eliminarOrdenPorAlimento(alimento: Alimento) {
        for orden in ordenes {
            if orden.Alimento == alimento {
                eliminarOrden(orden: orden)
                break
            }
        }
    }
    
    func obtenerCantidadAlimento(alimento: Alimento) -> Int{
        return ordenes.first { o in
            o.Alimento == alimento
        }?.Cantidad ?? 0
    }
    
    func ordenExistente(orden: Orden) -> Bool {
        return ordenes.contains { o in
            o.Alimento == orden.Alimento
        }
    }
    
    func modificarCantidadAlimento(orden: Orden, nuevaCantidad: Int){
        
        ordenes.first { o in
            o == orden
        }?.Cantidad = nuevaCantidad
        
    }
    
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
        
        if ordenes.isEmpty {
            return ""
        }
        
        var mensaje:String = "Elementos consumidos: \n"
        var total:Double = 0

        for orden in ordenes {
            mensaje += "  + \(orden.toString()) \n"
            total += orden.obtenerSubTotal()
        }
        mensaje += "\nSubtotal: $\(total) \n"

        let propina = obtenerPropina(subTotal: total)
        mensaje += "Propina \(propinaPorcentaje)%: $\(propina) \n"
        total += propina

        let descuento = obtenerDescuento(subTotal: total)
        if descuento > 0 {
            mensaje += "Descuento: $\(descuento) \n"
            total -= descuento
        }
        mensaje += "Total a pagar: $\(total)"
        return mensaje
    }
}

