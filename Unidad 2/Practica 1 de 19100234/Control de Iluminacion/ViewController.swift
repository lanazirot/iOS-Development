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
        lblNivelBrillo.text = "10%"
    }
    
    //Imagen bulbo
    
    @IBOutlet weak var imageBulbo: UIImageView!
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let nivelSeleccionado = Double(sender.value)
        lblNivelBrillo.text = String(Int(nivelSeleccionado*10) * 10) + "%"
        imageBulbo.alpha = Double( nivelSeleccionado)
    }
    
    @IBAction func btnAsignarBrilloEventListener(_ sender: UIButton) {
        
        imageBulbo.alpha = Double(sliderBrillo.value)
        
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
}

