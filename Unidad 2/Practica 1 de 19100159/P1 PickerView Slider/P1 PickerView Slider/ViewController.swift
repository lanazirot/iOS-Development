//
//  ViewController.swift
//  P1 PickerView Slider
//
//  Created by Admin on 01/04/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtApellido: UITextField!
    @IBOutlet weak var txtEdad: UITextField!
    @IBOutlet weak var sldNivel: UISlider!
    @IBOutlet weak var pkvCurso: UIPickerView!
    @IBOutlet weak var btnSuscribirse: UIButton!
    
    var todosCursos = ["Nivel 0: Introduccion", "Nivel 1: Vocabulario", "Nivel 2: Principiante", "Nivel 3: Intermedio", "Nivel 4: Avanzado", "Nivel 5: Perfeccionando mi ingles"]
    var cursoSeleccionado = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pkvCurso.dataSource = self
        pkvCurso.delegate = self
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return todosCursos.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return todosCursos[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cursoSeleccionado = todosCursos[row]
    }
    
    func getNombre() -> String {
        return txtNombre.text ?? ""
    }
    
    func getApellido() -> String {
        return txtApellido.text ?? ""
    }
    
    func getEdad() -> Int {
        return Int(txtEdad.text ?? "0") ?? 0
    }
    
    func getNivel() -> Int {
        return Int(sldNivel.value)
    }
    
    func generarAlerta(titulo:String, mensaje: String){
        let alerta: UIAlertController
        alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alerta, animated: true)
        
    }
    
    @IBAction func suscribirse(_ sender: Any) {
        let mensaje :String = "\(getNombre()) \(getApellido()) \n Te has suscrito al curso \(cursoSeleccionado), tomando en cuenta que tu edad es de \(getEdad()) y tu nivel actual de ingles es del \(getNivel())%."
        generarAlerta(titulo: "Felicidades", mensaje: mensaje)
    }
}

