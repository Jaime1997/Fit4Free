//
//  ExcercisesViewController.swift
//  Fit4Free
//
//  Created by Jaime Garza on 10/13/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation
import UIKit

class ExcercisesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var datePickerView: UIPickerView!
    
    let exercises = ["core", "lower_body", "upper_body"]
    var selectedRow : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView.delegate = self
        datePickerView.dataSource = self
        rotatePickerView(pickerView: datePickerView)
        
    }
    
    //Hace que el picker view muestre un componente por row
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Determina el numero de rows en el picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return exercises.count
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        //Esconde las barras de seleccion en el picker view
        pickerView.subviews[1].isHidden = true
        pickerView.subviews[2].isHidden = true
        
        //Inicializa el view dentro del picker view y su posicion
        let myView = UIView(frame: CGRect(x: 0, y: 0, width:pickerView.bounds.width - 0, height: 0))
        
        //Determina el tamaño de las imagenes en el picker view
        //Como esta rotado el axis-x funciona como y, igual en viceversa
        let myImageView = UIImageView(frame: CGRect(x: 60, y: 0, width: 200, height: 200))
        
        //Utiliza los strings para mostrar las imagenes
        myImageView.image = UIImage(named: exercises[row])
        
        //Rota la imagen dentro del picker view para que aparezca correctamente
        myImageView.transform = myImageView.transform.rotated(by: CGFloat.pi/2)

        //Agrega la imagen al picker view
        myView.addSubview(myImageView)
        return myView
    }
    
    //Rota el picker view para que funcione de izquierda a derecha
    func rotatePickerView(pickerView : UIPickerView) {
        let rotationAngle = -90 * (CGFloat.pi / 180)
        let y = pickerView.frame.origin.y
        let x = pickerView.frame.origin.x
        
        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = CGRect(x: x, y: y, width: pickerView.frame.height , height: pickerView.frame.width)
    }
    
    //Aumenta el tamaño entre componentes del picker view
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 200.0
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        selectedRow = row
        performSegue(withIdentifier: "goToDifficulty", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create a variable that you want to send
        let selectedBodyPart = exercises[selectedRow]
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! DifficultyViewController
        destinationVC.bodyPart = selectedBodyPart
    }
    
}
