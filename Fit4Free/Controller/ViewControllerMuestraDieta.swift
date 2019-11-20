//
//  ViewControllerMuestraDieta.swift
//  Fit4Free
//
//  Created by Alumno on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import UIKit

class ViewControllerMuestraDieta: UIViewController {

    var arrDieta : NSArray!
    var Hoy : NSDictionary!
    var Base : Int = 2400
    
    var QuemaDes: Double = 2400 * 0.40
    var QuemaCom: Double = 2400 * 0.30
    var QuemaCen: Double = 2400 * 0.30
    
    var calcula1: Double!
    var calcula2: Double!
    var calcula3: Double!
    var calcula4: Double!
    
    @IBOutlet weak var tfBase: UITextField!
    @IBOutlet weak var tvCalculadora: UITextView!
    @IBOutlet weak var segm: UISegmentedControl!
    
    @IBOutlet weak var lbDia: UILabel!
    @IBOutlet weak var lbDes1: UILabel!
    @IBOutlet weak var lbDes2: UILabel!
    @IBOutlet weak var lbDesCant1: UILabel!
    @IBOutlet weak var lbDesCant2: UILabel!
    @IBOutlet weak var lbDesCalTot1: UILabel!
    @IBOutlet weak var lbDesCalTot2: UILabel!
    @IBOutlet weak var lbCom1: UILabel!
    @IBOutlet weak var lbCom2: UILabel!
    @IBOutlet weak var lbComCant1: UILabel!
    @IBOutlet weak var lbComCant2: UILabel!
    @IBOutlet weak var lbComCalTot1: UILabel!
    @IBOutlet weak var lbComCalTot2: UILabel!
    @IBOutlet weak var lbCen1: UILabel!
    @IBOutlet weak var lbCen2: UILabel!
    @IBOutlet weak var lbCenCant1: UILabel!
    @IBOutlet weak var lbCenCant2: UILabel!
    @IBOutlet weak var lbCenCalTot1: UILabel!
    @IBOutlet weak var lbCenCalTot2: UILabel!
    
    var DatoDia: String!
    var DatoDes1: String!
    var DatoDes2: String!
    var DatoDesCant1: Int!
    var DatoDesCant2: Int!
    var DatoDesCalTot1: Int!
    var DatoDesCalTot2: Int!
    var DatoDesCals1001: Int!
    var DatoDesCals1002: Int!
    var DatoCom1: String!
    var DatoCom2: String!
    var DatoComCant1: Int!
    var DatoComCant2: Int!
    var DatoComCalTot1: Int!
    var DatoComCalTot2: Int!
    var DatoComCals1001: Int!
    var DatoComCals1002: Int!
    var DatoCen1: String!
    var DatoCen2: String!
    var DatoCenCant1: Int!
    var DatoCenCant2: Int!
    var DatoCenCalTot1: Int!
    var DatoCenCalTot2: Int!
    var DatoCenCals1001: Int!
    var DatoCenCals1002: Int!
    
    @IBAction func setBase(_ sender: Any) {
        Base = Int(tfBase.text!) ?? 2400
        QuemaDes = Double(Base) * 0.40
        QuemaCom = Double(Base) * 0.30
        QuemaCen = Double(Base) * 0.30
        actualizaDatos()
        //viewDidLoad()
    }
    
    @IBAction func daySelect(_ sender: Any) {
        Hoy = arrDieta[segm.selectedSegmentIndex] as! NSDictionary
        
        DatoDia = Hoy["Dia"] as! String
        DatoDes1 = Hoy["Des1"] as! String
        DatoDes2 = Hoy["Des2"] as! String
        DatoDesCals1001 = Hoy["DesCal1"] as! Int
        DatoDesCals1002 = Hoy["DesCal2"] as! Int
        DatoCom1 = Hoy["Com1"] as! String
        DatoCom2 = Hoy["Com2"] as! String
        DatoComCals1001 = Hoy["ComCal1"] as! Int
        DatoComCals1002 = Hoy["ComCal2"] as! Int
        DatoCen1 = Hoy["Cen1"] as! String
        DatoCen2 = Hoy["Cen2"] as! String
        DatoCenCals1001 = Hoy["CenCal1"] as! Int
        DatoCenCals1002 = Hoy["CenCal2"] as! Int
        actualizaDatos()
        
    }
    
    func actualizaDatos(){
        lbDia.text = DatoDia
        
        lbDes1.text = DatoDes1
        lbDes2.text = DatoDes2
        calcula1 = QuemaDes * 0.95
        calcula2 = QuemaDes * 0.05
        lbDesCalTot1.text = "\(calcula1!)"
        lbDesCalTot2.text = "\(calcula2!)"
        calcula3 = (calcula1 / Double(DatoDesCals1001)) * 100
        calcula3 = Double(round(1000*calcula3)/1000)
        calcula4 = (calcula2 / Double(DatoDesCals1002)) * 100
        calcula4 = Double(round(1000*calcula4)/1000)
        lbDesCant1.text = "\(calcula3!)"
        lbDesCant2.text = "\(calcula4!)"
        
        lbCom1.text = DatoCom1
        lbCom2.text = DatoCom2
        calcula1 = QuemaCom * 0.95
        calcula2 = QuemaCom * 0.05
        lbComCalTot1.text = "\(calcula1!)"
        lbComCalTot2.text = "\(calcula2!)"
        calcula3 = (calcula1 / Double(DatoComCals1001)) * 100
        calcula3 = Double(round(1000*calcula3)/1000)
        calcula4 = (calcula2 / Double(DatoComCals1002)) * 100
        calcula4 = Double(round(1000*calcula4)/1000)
        lbComCant1.text = "\(calcula3!)"
        lbComCant2.text = "\(calcula4!)"
        
        lbCen1.text = DatoCen1
        lbCen2.text = DatoCen2
        calcula1 = QuemaCen * 0.95
        calcula2 = QuemaCen * 0.05
        lbCenCalTot1.text = "\(calcula1!)"
        lbCenCalTot2.text = "\(calcula2!)"
        calcula3 = (calcula1 / Double(DatoCenCals1001)) * 100
        calcula3 = Double(round(1000*calcula3)/1000)
        calcula4 = (calcula2 / Double(DatoCenCals1002)) * 100
        calcula4 = Double(round(1000*calcula4)/1000)
        lbCenCant1.text = "\(calcula3!)"
        lbCenCant2.text = "\(calcula4!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTextView()
        
        daySelect(self)
        
    }
    
    func updateTextView(){
        let miPath = "https://www.yazio.com/es/calculadora-calorias-diarias"
        let texto = tvCalculadora.text ?? ""
        let attributedString = NSAttributedString.makeHyperlink(for: miPath, in: texto, as: "Calculadora Calorica")
        //let font = tvCalculadora.font
        //let textColor = tvCalculadora.textColor
        tvCalculadora.attributedText = attributedString
        //tvCalculadora.font = font
        //tvCalculadora.textColor = textColor
    }
    
    /*
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }*/

}
