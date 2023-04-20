//
//  ViewController.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Globales
    var menu: [Alimento] = []
        
    //Mesas
    let mesas: [Mesa] = [Mesa(mesa: 0), Mesa(mesa: 1), Mesa(mesa: 2)]
    var currentMesa: Mesa!
    
    
    //Funciones pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int { return 1 }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int { return menu.count }
    

    //Labels
    @IBOutlet weak var lblMontoMesa: UILabel!
    @IBOutlet weak var lblCurrentAlimentoCantidad: UILabel!
    
    //Menu
    @IBOutlet weak var pkvMenu: UIPickerView!
    @IBOutlet weak var imgMenu: UIImageView!
    
    //Mesa
    @IBOutlet weak var sgctrlMesa: UISegmentedControl!
    
    //Descuento
    @IBOutlet weak var switchDescuento: UISwitch!
    
    //Cantidad
    @IBOutlet weak var stpCantidadAlimento: UIStepper!
    
    
    //App
    override func viewDidLoad() {
        super.viewDidLoad()
        agregarElementosMenu()
        pkvMenu.delegate = self
        pkvMenu.dataSource = self
        lblMontoMesa.text = ""
        refreshSelection(mesa: 0)
    }
    
    func agregarElementosMenu(){
        let nuevoMenu = Menu()
        menu.append(contentsOf: nuevoMenu.Alimentos)
    }
    
    func refreshSelection(mesa: Int){
        
        let mesaValorArreglo = mesa
        currentMesa = mesas[mesaValorArreglo]
        pkvMenu.selectRow(0, inComponent: 0, animated: true)
        imgMenu.image = UIImage(named: menu[0].NombreImagen)
        switchDescuento.setOn(currentMesa.TengoDescuento, animated: true)
        let currentCantidad = currentMesa.Ordenes.first { o in
            o.Alimento.Nombre == menu[0].Nombre
        }?.Cantidad ?? 0
        stpCantidadAlimento.value = Double(currentCantidad)
        lblCurrentAlimentoCantidad.text = "\(currentCantidad)"
        lblMontoMesa.text = ""
    }
    
    
    /**Cuando cambia la mesa*/
    @IBAction func onMesaValueChanged(_ sender: UISegmentedControl) {
        refreshSelection(mesa: sender.selectedSegmentIndex)
    }
        
    /**Titulo del pickerview de los alimentos**/
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menu[row].toString()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentAlimento = menu[row]
        imgMenu.image = UIImage(named: currentAlimento.NombreImagen)
        let currentCantidad = currentMesa.obtenerCantidadAlimento(alimento: currentAlimento)
        stpCantidadAlimento.value = Double(currentCantidad)
        lblCurrentAlimentoCantidad.text = "\(currentCantidad)"
    }
    
    /**Eventos botones**/
    @IBAction func onAgregarPropinaEventListener(_ sender: UIButton) {
        let alerta: UIAlertController
        
        alerta = UIAlertController(title: "Propina", message: "Elija un monto", preferredStyle: .actionSheet)
    
        alerta.addAction(UIAlertAction(
            title: "3%", style: .default,
            handler: {
                action in
                self.currentMesa.PropinaPorcentaje = 3
            }
        ))
        alerta.addAction(UIAlertAction(
            title: "10%", style: .default,
            handler: {
                action in
                self.currentMesa.PropinaPorcentaje = 10
            }

        ))
        alerta.addAction(UIAlertAction(
            title: "15%", style: .default,
            handler: {
                action in
                self.currentMesa.PropinaPorcentaje = 15
            }

        ))
        alerta.addAction(UIAlertAction(
            title: "Cancelar (no dejar propina)", style: .cancel,
            handler: { action in
                self.currentMesa.PropinaPorcentaje = 0
            }
        ))
        present(alerta, animated: true)
    }
    
    
    @IBAction func onCalcularTotalEventListener(_ sender: UIButton) {
        lblMontoMesa.text = currentMesa.cobrarMesa()
    }
    
    
    @IBAction func onCantidadAlimentoValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        let currentAlimento = menu[pkvMenu.selectedRow(inComponent: 0)]
        if(value == 0){
            currentMesa.eliminarOrdenPorAlimento(alimento: currentAlimento)
            lblCurrentAlimentoCantidad.text = "0"
        }else{
            let orden = Orden(alimento: menu[pkvMenu.selectedRow(inComponent: 0)], cantidad: value)
            let find = currentMesa.ordenExistente(orden: orden)
            if(find){
                currentMesa.modificarCantidadAlimento(orden: orden, nuevaCantidad: value)
            }else{
                currentMesa.agregarOrden(orden: orden)
            }
            lblCurrentAlimentoCantidad.text = "\(orden.Cantidad)"
        }
    }
    
    
    @IBAction func onSwitchDescuentoValueChanged(_ sender: UISwitch) {
        currentMesa.TengoDescuento = sender.isOn
    }
}

