//
//  ViewController.swift
//  MapRoute
//
//  Created by  on 17/01/2020.
//  Copyright © 2020 Gustavo Villa Diez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    //Ida
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatosSegue" {
            let destino = segue.destination as! DatosViewController;
            destino.texto = "¡Hooola!"
        }
        
        if segue.identifier == "RunningSegue"{
            let destino = segue.destination as! MapViewController;
            destino.texto = "Modo: RUNNING"
        }
        
        if segue.identifier == "CarSegue"{
            let destino = segue.destination as! MapViewController;
            destino.texto = "Modo: DRIVING"
        }
     }
    
    
    //Vuelta(Unwid)
    @IBAction func guardar(segue: UIStoryboardSegue){
        print("Has pedido guardar")
    }
    
    @IBAction func cancelar(segue: UIStoryboardSegue){
        print("Has pedido cancelar")
    }

}

