//
//  ViewControllerDietas.swift
//  Fit4Free
//
//  Created by Alumno on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerDietas: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaSig = segue.destination as! ViewControllerListaDietas
        
        if segue.identifier == "MuscleGain"{
            vistaSig.tipoLista = "Muscle Gain"
            vistaSig.MuestraPlist = 1
        }else if segue.identifier == "WeightLoss"{
            vistaSig.tipoLista = "Weight Loss"
            vistaSig.MuestraPlist = 2
        }else if segue.identifier == "LowCarbs"{
            vistaSig.tipoLista = "Low Carbs"
            vistaSig.MuestraPlist = 3
        }else if segue.identifier == "SugarFree"{
            vistaSig.tipoLista = "Sugar Free"
            vistaSig.MuestraPlist = 4
        }
    }
    

}
