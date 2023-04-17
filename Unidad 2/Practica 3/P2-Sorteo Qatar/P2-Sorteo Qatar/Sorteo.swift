//
//  Sorteo.swift
//  P2-Sorteo Qatar
//
//  Created by Alan Castro on 11/04/23.
//

import Foundation

class Sorteo {
    var paisesSeleccionados: [Pais]
    var conteoConfederacion1: Int
    var conteoConfederacion2: Int
    var conteoConfederacion3: Int
    var conteoConfederacion4: Int
    var conteoConfederacion5: Int

    init(paisesSeleccionados: [Pais]) {
        self.paisesSeleccionados = paisesSeleccionados
        conteoConfederacion1 = 0
        conteoConfederacion2 = 0
        conteoConfederacion3 = 0
        conteoConfederacion4 = 0
        conteoConfederacion5 = 0
    }

    func intentarAregarPais(pais: Pais) -> Bool {
        var confederacionPais = pais.confederacion

        //En base a los conteos de confederaciones..
        switch confederacionPais {
        case 1:
            //Si el pais aleatorio es conf 1, y el conteo de conf1 es == 0
                //Guardalo, no hay ninguno con esta confederacion
                //SiNoEntonces NO lo guardes, genera otro aleatorio excluyendo este pais
            if conteoConfederacion1 > 0 {
                return false
            } else {
                conteoConfederacion1 += 1
            }
        case 2:
            //Si el pais aleatorio es conf 2, y el conteo de conf2 es == 0
                //Guardalo, no hay ninguno con esta confederacion
                //SiNoEntonces NO lo guardes, genera otro aleatorio excluyendo este pais
            if conteoConfederacion2 > 0 {
                return false
            } else {
                conteoConfederacion2 += 1
            }
        case 3:
            //Si el pais aleatorio es conf 3, y el conteo de conf3 es == 0
                //Guardalo, no hay ninguno con esta confederacion
                //SiNoEntonces NO lo guardes, genera otro aleatorio excluyendo este pais
            if conteoConfederacion3 > 0 {
                return false
            } else {
                conteoConfederacion3 += 1
            }
        case 4:
            //Si el pais aleatorio es conf 4, y el conteo de conf4 es == 0
                //Guardalo, no hay ninguno con esta confederacion
                //SiNoEntonces NO lo guardes, genera otro aleatorio excluyendo este pais
            if conteoConfederacion4 > 0 {
                return false
            } else {
                conteoConfederacion4 += 1
            }
        case 5:
            //Si el pais aleatorio es conf 5, y el conteo de conf5 es < 2
                //Guardalo, puedes tener hasta dos de esta confederacion
                //SiNoEntonces NO lo guardes, genera otro aleatorio excluyendo este pais
            if conteoConfederacion5 > 1 {
                return false
            } else {
                conteoConfederacion5 += 1
            }
        default:
            print("Confederación no válida")
            return false
        }

        //Si llegaste hasta aca, es porque si se puede guardar el pais
        //El conteo de la confederacion ya se incremento
        paisesSeleccionados.append(pais)

        return true //Si se agrego el pais, no es necesario generar otro
    }
}
