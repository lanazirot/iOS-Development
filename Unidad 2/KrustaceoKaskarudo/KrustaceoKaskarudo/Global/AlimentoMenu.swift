//
//  ListaAlimentos.swift
//  KrustaceoKaskarudo
//
//  Created by Alan Peña on 18/04/23.
//

import Foundation

enum AlimentoMenu: Double {
    case hamburguesaSencilla = 40.0
    case hamburguesaConQueso = 50.0
    case papasFritas = 20.0
    case refresco = 12.0
    case postre = 8.0
    
    var nombre: String {
        switch self {
        case .hamburguesaSencilla:
            return "Hamburguesa Sencilla $\(self.rawValue)"
        case .hamburguesaConQueso:
            return "Hamburguesa con Queso $\(self.rawValue)"
        case .papasFritas:
            return "Papas Fritas $\(self.rawValue)"
        case .refresco:
            return "Refresco $\(self.rawValue)"
        case .postre:
            return "Postre $\(self.rawValue)"
        }
    }
    
    var imagen: String {
        switch self {
        case .hamburguesaSencilla:
            return "hamburguesaSencilla"
        case .hamburguesaConQueso:
            return "hamburguesaConQueso"
        case .papasFritas:
            return "papasFritas"
        case .refresco:
            return "refresco"
        case .postre:
            return "postre"
        }
    }
}


