//
//  Alimento.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import Foundation

class Alimento : Equatable {
    
    static func == (lhs: Alimento, rhs: Alimento) -> Bool {
        return lhs.Nombre == rhs.Nombre
    }
    
    private var nombre:String
    private var precio:Double
    private var nombreImagen:String

    public var Nombre:String {
        get {
            return nombre
        }
        set {
            nombre = newValue
        }
    }

    public var Precio:Double {
        get {
            return precio
        }
        set {
            precio = newValue
        }
    }
    
    public var NombreImagen:String{
        get{
            return nombreImagen
        }
        set{
            nombreImagen = newValue
        }
    }

    
    
    init(nombre:String, precio: Double, imagen: String) {
        self.nombre = nombre
        self.precio = precio
        self.nombreImagen = imagen
    }
    
    public func toString() -> String {
        return "\(nombre) $\(precio)"
    }
}

