//
//  ViewController.swift
//  P2-Sorteo Qatar
//
//  Created by Alan Castro on 01/04/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    ///Componentes
    @IBOutlet weak var sgmBombos: UISegmentedControl!
    @IBOutlet weak var pkvSelecciones: UIPickerView!
    @IBOutlet weak var btnSortear: UIButton!
    @IBOutlet weak var imgEquipo1: UIImageView!
    @IBOutlet weak var imgEquipo2: UIImageView!
    @IBOutlet weak var imgEquipo3: UIImageView!
    @IBOutlet weak var imgEquipo4: UIImageView!
    @IBOutlet weak var lblEquipo1: UILabel!
    @IBOutlet weak var lblEquipo2: UILabel!
    @IBOutlet weak var lblEquipo3: UILabel!
    @IBOutlet weak var lblEquipo4: UILabel!
    @IBOutlet weak var lblConfederaciones: UILabel!
    ///...
    
    ///Variables
    var paisSeleccionado:Pais = Pais(nombre: "Qatar", confederacion: 5, bandera: "qa.png")
    
    var bombos = [
        Bombo(nombre: "Bombo 1", paises: [
            Pais(nombre: "Qatar", confederacion: 5, bandera: "qa.png"),
            Pais(nombre: "Belgica", confederacion: 5, bandera: "be.png"),
            Pais(nombre: "Brasil", confederacion: 4, bandera: "br.png"),
            Pais(nombre: "Francia", confederacion: 5, bandera: "fr.png"),
            Pais(nombre: "Argentina", confederacion: 4, bandera: "ar.png"),
            Pais(nombre: "Inglaterra", confederacion: 5, bandera: "gb-eng.png"),
            Pais(nombre: "España", confederacion: 5, bandera: "es.png"),
            Pais(nombre: "Portugal", confederacion: 5, bandera: "pt.png")
        ]),
        Bombo(nombre: "Bombo 2", paises: [
            Pais(nombre: "Dinamarca", confederacion: 5, bandera: "dk.png"),
            Pais(nombre: "Paises Bajos", confederacion: 5, bandera: "nl.png"),
            Pais(nombre: "Alemania", confederacion: 5, bandera: "de.png"),
            Pais(nombre: "Suiza", confederacion: 5, bandera: "ch.png"),
            Pais(nombre: "Croacia", confederacion: 5, bandera: "hr.png"),
            Pais(nombre: "Uruguay", confederacion: 4, bandera: "uy.png"),
            Pais(nombre: "Mexico", confederacion: 1, bandera: "mx.png"),
            Pais(nombre: "EE.UU", confederacion: 1, bandera: "us.png")
        ]),
        Bombo(nombre: "Bombo 3", paises: [
            Pais(nombre: "Iran", confederacion: 5, bandera: "ir.png"),
            Pais(nombre: "Japon", confederacion: 3, bandera: "jp.png"),
            Pais(nombre: "Serbia", confederacion: 5, bandera: "rs.png"),
            Pais(nombre: "Corea del Sur", confederacion: 3, bandera: "kr.png"),
            Pais(nombre: "Tunez", confederacion: 5, bandera: "tn.png"),
            Pais(nombre: "Polonia", confederacion: 5, bandera: "pl.png"),
            Pais(nombre: "Marruecos", confederacion: 2, bandera: "ma.png"),
            Pais(nombre: "Senegal", confederacion: 5, bandera: "sn.png")
        ]),
        Bombo(nombre: "Bombo 4", paises: [
            Pais(nombre: "Arabia Saudita", confederacion: 3, bandera: "sa.png"),
            Pais(nombre: "Ecuador", confederacion: 4, bandera: "ec.png"),
            Pais(nombre: "Ghana", confederacion: 2, bandera: "gh.png"),
            Pais(nombre: "Canada", confederacion: 1, bandera: "ca.png"),
            Pais(nombre: "Camerun", confederacion: 2, bandera: "cm.png"),
            Pais(nombre: "Australia", confederacion: 3, bandera: "au.png"),
            Pais(nombre: "Costa Rica", confederacion: 1, bandera: "cr.png"),
            Pais(nombre: "Gales", confederacion: 5, bandera: "gb-wls.png")
        ]),
    ];
    ///...

    override func viewDidLoad() {
        super.viewDidLoad()
        pkvSelecciones.dataSource = self
        pkvSelecciones.delegate = self
    }

    @IBAction func sortear(_ sender: Any) {
        //Lista de paises que fueron sorteados
        let sorteo = Sorteo(paisesSeleccionados: [])
        
        //Agregar pais seleccionado como primero de los sorteados
        if(!sorteo.intentarAregarPais(pais: paisSeleccionado)) {
            return //Nunca deberia pasar, solo para que no tire la advertencia
        }

        //Obtener pais al azar del bombo 2, 3 y 4 [REPETIR 3 VECES]
        for i in 1...3 {
            let bomboActual = bombos[i]
            var estoyBuscandoUnPaisAleatorio = true

            while estoyBuscandoUnPaisAleatorio {
                //Obtener un pais totalmente aleatorio del bombo actual
                let paisAleatorio = bomboActual.obtenerPaisAleatorio()
                estoyBuscandoUnPaisAleatorio = !sorteo.intentarAregarPais(pais: paisAleatorio)
            }
        }
        
        //Al finalizar el ciclo, ya cuentas con un listado de los cuatro paises seleccionados, muestralos
        mostrarPaisesSorteados(paisesSorteados: sorteo.paisesSeleccionados)
    }
    
    @IBAction func onChangeBombo(_ sender: Any) {
        var mensaje = ""
        let bomboSeleccionado = (sender as AnyObject).selectedSegmentIndex ?? 0
        
        if(bomboSeleccionado == 0) {
            return
        }
            
        for pais in bombos[bomboSeleccionado].paises {
            mensaje += "- \(pais.nombre)\n"
        }
       
        sgmBombos.selectedSegmentIndex = 0
        if mensaje != "" {
            generarAlerta(titulo: "Paises miembros del \(bombos[bomboSeleccionado].nombre)", mensaje: mensaje)
        }
            
    }
    
    ///Funciones auxiliares
    func mostrarPaisesSorteados(paisesSorteados :Array<Pais>) {
        imgEquipo1.image = UIImage(named: paisesSorteados[0].bandera)
        lblEquipo1.text = paisesSorteados[0].nombre
        
        imgEquipo2.image = UIImage(named: paisesSorteados[1].bandera)
        lblEquipo2.text = paisesSorteados[1].nombre
        
        imgEquipo3.image = UIImage(named: paisesSorteados[2].bandera)
        lblEquipo3.text = paisesSorteados[2].nombre
        
        imgEquipo4.image = UIImage(named: paisesSorteados[3].bandera)
        lblEquipo4.text = paisesSorteados[3].nombre
        
        //Para pruebas: Descomentar y ver si las confederaciones estan correctas:)
        //lblConfederaciones.text = String(paisesSorteados[0].confederacion) + " " + String(paisesSorteados[1].confederacion) + " " + String(paisesSorteados[2].confederacion) + " " + String(paisesSorteados[3].confederacion) + " "
    }
    ///...
    
    ///Alerta
    func generarAlerta(titulo:String, mensaje: String){
        let alerta: UIAlertController
        alerta = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Aceptar", style: .default))
        present(alerta, animated: true)
    }
    ///...
    
    ///Picker View
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return paisSeleccionado = bombos[0].paises[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bombos[0].paises[row].nombre
    }
    ///...
}
