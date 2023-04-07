//
//  ViewController.swift
//  Examen Unidad 1
//
//  Created by Alan Peña on 06/04/23.
//

import UIKit

enum TipoVehiculo{
    case autobus
    case limosina
}


class ViewController: UIViewController {

    
    //General
    @IBOutlet weak var txtPlacas: UITextField!
    @IBOutlet weak var txtTarifa: UITextField!
    
    //Para el autobus
    @IBOutlet weak var txtKmFinal: UITextField!
    @IBOutlet weak var lblKmFinal: UILabel!
    @IBOutlet weak var lblKmFinalValor: UILabel!
    
    //Controles compartidos
    @IBOutlet weak var lblEtiquetaMain: UILabel!
    @IBOutlet weak var txtValorCompartido: UITextField!
    @IBOutlet weak var lblTipoValorMain: UILabel!
    
    var currentTipoVehiculo: TipoVehiculo = .autobus
    
    
    @IBOutlet weak var txtImporteTotal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    @IBAction func onVehicleSelected(_ sender: UISegmentedControl) {
        txtImporteTotal.text = "0.00"
        txtValorCompartido.text = ""
        txtKmFinal.text = ""
        let tipoVehiculo = sender.titleForSegment(at: sender.selectedSegmentIndex)
        if(tipoVehiculo == "Limosina"){
            lblEtiquetaMain.text = "Dias totales"
            lblTipoValorMain.text = "dia(s)"
            
            //Ocultamos los demas controles
            lblKmFinalValor.isHidden = true
            lblKmFinal.isHidden = true
            txtKmFinal.isHidden = true
            
            currentTipoVehiculo = .limosina
            
        }else{
            lblEtiquetaMain.text = "Km Inicial"
            lblTipoValorMain.text = "km(s)"
            
            //Mostramos los demas controles
            lblKmFinalValor.isHidden = false
            lblKmFinal.isHidden = false
            txtKmFinal.isHidden = false
            
            currentTipoVehiculo = .autobus
        }
    }
    
    
    @IBAction func btnCalcularImporteEventListener(_ sender: UIButton) {
        
        
        switch currentTipoVehiculo {
        case .autobus:
            
            let autobus = Autobus()
             autobus.Placas = txtPlacas.text!
             autobus.Tarifa = Double(txtTarifa.text!)!
             autobus.KmInicial = Int(txtValorCompartido.text!)!
             autobus.KmFinal = Int(txtKmFinal.text!)!

             //Coloca el importe total redondeado a 2 decimnales
            txtImporteTotal.text = String(format: "%.2f", autobus.calcularImporte())

            
            break
            
        case .limosina:
            
            
            let limosina = Limosina()
            limosina.Placas = txtPlacas.text!
            limosina.Tarifa = Double(txtTarifa.text!)!
            limosina.DiasTotales = Int(txtValorCompartido.text!)!

            //Coloca el importe total redondeado a 2 decimnales
            txtImporteTotal.text = String(format: "%.2f", limosina.calcularImporte())
            

            
            break
        }
            
        
    }
    
}

