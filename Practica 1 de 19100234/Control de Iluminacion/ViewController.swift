//
//  ViewController.swift
//  Control de Iluminacion
//
//  Created by Alan Peña on 27/03/23.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource{
    
    //Smart components
    private var smartComponents = [
        "Lampara cocina",
        "Lampara habitacion",
        "Foco cochera"
    ]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return smartComponents.count
        
    }
    
    //Variables controladoras
    private var currentSmartComponent: String = ""
    
    //Componentes
    @IBOutlet weak var sliderBrillo: UISlider!
    
    @IBOutlet weak var pkvSmartComponents: UIPickerView!
    
    @IBOutlet weak var lblNivelBrillo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentSmartComponent = smartComponents[0]
        pkvSmartComponents.delegate = self
        pkvSmartComponents.dataSource = self
    }
    
    //Imagen bulbo
    
    @IBOutlet weak var imageBulbo: UIImageView!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let nivelSeleccionado = Double(sender.value)
        lblNivelBrillo.text = String(Int(nivelSeleccionado*10))
        imageBulbo.alpha = Double( nivelSeleccionado)
    }
    
    @IBAction func btnAsignarBrilloEventListener(_ sender: UIButton) {
        
        
        let toast = UIAlertController(title: "Nivel de brillo", message: "Nivel de brillo seleccionado: \(String(describing: lblNivelBrillo.text!) ) al smart component \(currentSmartComponent)", preferredStyle: .alert)
                toast.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(toast, animated: true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return smartComponents[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currentSmartComponent=smartComponents[row]
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

