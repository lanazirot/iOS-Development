//
//  ViewController.swift
//  KrustaceoKaskarudo
//
//  Created by Admin on 18/04/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //Globales
    let menu: [AlimentoMenu] = [.hamburguesaSencilla, .hamburguesaConQueso, .papasFritas, .refresco, .postre]
    
    //Mesas
    let mesas: [Mesa] = [Mesa(mesa: 0), Mesa(mesa: 1), Mesa(mesa: 2)]
    var currentMesa: Mesa!
    
    
    //Funciones pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menu.count
    }
    

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
        pkvMenu.delegate = self
        pkvMenu.dataSource = self
        lblMontoMesa.text = ""
        refreshSelection(mesa: 0)
    }
    
    func refreshSelection(mesa: Int){
        
        let mesaValorArreglo = mesa
        currentMesa = mesas[mesaValorArreglo]
        pkvMenu.selectRow(0, inComponent: 0, animated: true)
        imgMenu.image = UIImage(named: menu[0].imagen)
        switchDescuento.setOn(currentMesa.tengoDescuento, animated: true)
        let currentCantidad = currentMesa.ordenes.first { o in
            o.alimento == menu[0]
        }?.cantidad ?? 0
        stpCantidadAlimento.value = Double(currentCantidad)
        lblCurrentAlimentoCantidad.text = "\(currentCantidad)"
        if(!currentMesa.ordenes.isEmpty){
            lblMontoMesa.text = currentMesa.cobrarMesa()
        }else{
            lblMontoMesa.text = ""
        }
    }
    
    
    /**Cuando cambia la mesa*/
    @IBAction func onMesaValueChanged(_ sender: UISegmentedControl) {
        refreshSelection(mesa: sender.selectedSegmentIndex)
    }
        
    /**Titulo del pickerview de los alimentos**/
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menu[row].nombre
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentAlimento = menu[row]
        imgMenu.image = UIImage(named: currentAlimento.imagen)
        let currentCantidad = currentMesa.ordenes.first { o in
            o.alimento == currentAlimento
        }?.cantidad ?? 0
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
                self.currentMesa.propinaPorcentaje = 3
            }
        ))
        alerta.addAction(UIAlertAction(
            title: "10%", style: .default,
            handler: {
                action in
                self.currentMesa.propinaPorcentaje = 10
            }

        ))
        alerta.addAction(UIAlertAction(
            title: "15%", style: .default,
            handler: {
                action in
                self.currentMesa.propinaPorcentaje = 15
            }

        ))
        alerta.addAction(UIAlertAction(
            title: "Cancelar (no dejar propina)", style: .cancel,
            handler: { action in
                self.currentMesa.propinaPorcentaje = 0
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
            currentMesa.ordenes.removeAll { orden in
                orden.alimento == currentAlimento
            }
            lblCurrentAlimentoCantidad.text = "0"
        }else{
            let orden = Orden(alimento: menu[pkvMenu.selectedRow(inComponent: 0)], cantidad: value)
            
            let find = currentMesa.ordenes.contains(where: { o in
                o.alimento == orden.alimento
            })
            
            if(find){
                currentMesa.ordenes.first { o in
                    o.alimento == orden.alimento
                }?.cantidad = value
            }else{
                currentMesa.ordenes.append(orden)
            }
            lblCurrentAlimentoCantidad.text = "\(orden.cantidad)"
        }
    }
    
    
    @IBAction func onSwitchDescuentoValueChanged(_ sender: UISwitch) {
        currentMesa.tengoDescuento = sender.isOn
    }
    
    
    func GenerarAlerta(tipoAlerta: Int,
                       titulo: String, mensaje: String){
        let alerta: UIAlertController
        
        if(tipoAlerta==1){
            alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        
            //Agregar un boton a la alerta
        
            //titulo: Lo que dira el boton
            //style: es el tipo de boton
            //  default -> ok
            //  cancel -> fuente en negritas
            // destructive -> en rojo
            
            
            alerta.addAction(UIAlertAction(
                title: "Ok", style: .default
            ))
            
            
            alerta.addAction(UIAlertAction(
                title: "De acuerdo", style: .default
            ))
            
            alerta.addAction(UIAlertAction(
                title: "Cancelar", style: .cancel
            ))
            
            //Param completion es para mostrar algo cuando se termina de mostrar la alerta
            
            present(alerta, animated: true,
                    completion: {
                print("Ya se mostro la alerta")
            })
        }else if (tipoAlerta==2){
            //actionSheet, osea desde abajo de la pantalla
            alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .actionSheet)
        
            //Agregar un boton a la alerta
        
            //titulo: Lo que dira el boton
            //style: es el tipo de boton
            //  default -> ok
            //  cancel -> fuente en negritas
            // destructive -> en rojo
            
            
            alerta.addAction(UIAlertAction(
                title: "Ok", style: .default
            ))

            
            present(alerta, animated: true)

        }else if (tipoAlerta==3){
            alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .actionSheet)
        
            //Agregar un boton a la alerta
            //El estilo default se puede agregar tantas veces necesitemos, pero lo que es el cancel y destructive, una sola vez
            alerta.addAction(UIAlertAction(
                title: "Ok", style: .default,
                handler: {
                    action in
                    print("Se presiono OK")
                }
            ))
            alerta.addAction(UIAlertAction(
                title: "Another default", style: .default,
                handler: {
                    action in
                    print("Se presiono Another default")
                }

            ))
            alerta.addAction(UIAlertAction(
                title: "De acuerdo default", style: .default,
                handler: {
                    action in
                    print("Se presiono De acuerdo default")
                }

            ))
            alerta.addAction(UIAlertAction(
                title: "Cuidado", style: .destructive,
                handler: {
                    action in
                    print("Se presiono Cuidado")
                }

            ))
            alerta.addAction(UIAlertAction(
                title: "Cancelar", style: .cancel,handler: {
                    action in
                    print("Se presiono Cancelar")
                }

            ))
            
            present(alerta, animated: true)

        }else if(tipoAlerta==4){
            //Solicitar valores al usuario
            alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)

            
            alerta.addTextField(configurationHandler: {
                action in
                
                action.placeholder = "Edad... i.e 21"
                action.keyboardType = .numberPad
                
            })
            
            alerta.addAction(UIAlertAction(
                title: "Aceptar", style: .default,
                handler: {
                    action in
                    
                  /*  guard let camposTexto = alerta.textFields, camposTexto.count == 1 else {
                        return
                    } */
                    
                    
                    if let camposTexto = alerta.textFields{
                        let edad = camposTexto[0].text!
                        print("La edad es \(edad)")
                        
                    }
                }

            ))
            alerta.addAction(UIAlertAction(
                title: "Cancelar", style: .cancel,handler: {
                    action in
                }

            ))
            
            present(alerta, animated: true)
        }
    }

    @IBAction func btnAlertaEventHandler(_ sender: UIButton) {
        GenerarAlerta(tipoAlerta: 4, titulo: "Usuario 🏄‍♀️", mensaje: "Ingresa tu edad")
    }
    
    
}

