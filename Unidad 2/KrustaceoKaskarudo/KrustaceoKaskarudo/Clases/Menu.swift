//
//  Menu.swift
//  KrustaceoKaskarudo
//
//  Created by Alan Peña on 19/04/23.
//

import Foundation

class Menu {
    
    private var alimentos: [Alimento] = []
    
    public var Alimentos: [Alimento] {
        get { return alimentos }
    }
    
    init() {
        alimentos.append(Alimento(nombre: "Hamburguesa sencilla", precio: 40.0, imagen: "hamburguesaSencilla"))
        alimentos.append(Alimento(nombre: "Hamburguesa con queso", precio: 50.0, imagen: "hamburguesaConQueso"))
        alimentos.append(Alimento(nombre: "Papas fritas", precio: 20.0, imagen: "papasFritas"))
        alimentos.append(Alimento(nombre: "Refresco", precio: 12.0, imagen: "refresco"))
        alimentos.append(Alimento(nombre: "Postre", precio: 8.0, imagen: "postre"))
    }
    
}
