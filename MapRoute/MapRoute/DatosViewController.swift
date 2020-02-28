//
//  DatosViewController.swift
//  MapRoute
//
//  Created by  on 13/02/2020.
//  Copyright © 2020 Gustavo Villa Diez. All rights reserved.
//

import UIKit

class DatosViewController: UIViewController {

    
    @IBOutlet weak var etiqueta: UILabel!
    
    var texto: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        etiqueta.text = texto
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
