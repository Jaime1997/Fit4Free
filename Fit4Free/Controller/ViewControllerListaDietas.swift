//
//  ViewControllerListaDietas.swift
//  Fit4Free
//
//  Created by Alumno on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation
import UIKit

class ViewControllerListaDietas: UIViewController,UITableViewDataSource, UITableViewDelegate{
    
    var tipoLista:String!
    var MuestraPlist: Int!
    
    //var miPath: IndexPath!
    
    @IBOutlet weak var lbTipoDieta: UILabel!
    
    var arrDiccionarios : NSArray!
    var pasoArray : NSArray!
    
    override func viewDidLoad() {
        self.title = tipoLista
        super.viewDidLoad()
        lbTipoDieta.text = tipoLista
        
        if MuestraPlist == 1 {
            let path = Bundle.main.path(forResource: "MuscleGain", ofType: "plist")!
            arrDiccionarios = NSArray(contentsOfFile: path)!
        }else if MuestraPlist == 2{
            let path = Bundle.main.path(forResource: "WeightLoss", ofType: "plist")!
            arrDiccionarios = NSArray(contentsOfFile: path)!
        }else if MuestraPlist == 3{
            let path = Bundle.main.path(forResource: "LowCarbs", ofType: "plist")!
            arrDiccionarios = NSArray(contentsOfFile: path)!
        }else if MuestraPlist == 4{
            let path = Bundle.main.path(forResource: "SugarFree", ofType: "plist")!
            arrDiccionarios = NSArray(contentsOfFile: path)!
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDiccionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCelda")!
        
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        //titulo solo se lo puse a SugarFree Plist.
        cell.textLabel?.text = dic["Name"] as! String
        
        //miPath = indexPath
        pasoArray = dic["Dias"] as! NSArray
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vistaSig = segue.destination as! ViewControllerMuestraDieta
        
        vistaSig.arrDieta = pasoArray
        
    }


}
