//
//  ViewControllerProfile.swift
//  Fit4Free
//
//  Created by Alumno on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import UIKit

class ViewControllerProfile: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    @IBOutlet weak var tfBmi: UITextField!
    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var tfSexo: UITextField!
    @IBOutlet weak var tfNombre: UITextField!
    @IBOutlet weak var btEditarFoto: UIButton!
    @IBOutlet weak var imgFoto: UIImageView!
    
    @IBOutlet weak var Editar: UIBarButtonItem!
    @IBOutlet weak var btChangePic: UIButton!
    
    @IBOutlet weak var viewBMI: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Perfil de Usuario"
        self.tfBmi.isEnabled = false
        self.tfPeso.isEnabled = false
        self.tfAltura.isEnabled = false
        self.tfSexo.isEnabled = false
        self.tfNombre.isEnabled = false
        
        let filePath = dataFilePath()
        if FileManager.default.fileExists(atPath: filePath){
            let arreglo = NSArray(contentsOfFile: filePath)!
            tfBmi.text = arreglo[0] as? String
            tfPeso.text = arreglo[1] as? String
            tfAltura.text = arreglo[2] as? String
            tfSexo.text = arreglo[3] as? String
            tfNombre.text = arreglo[3] as? String
            
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(applicacionBackground(notification:)), name: UIApplication.didEnterBackgroundNotification, object: app)
    }

    @IBAction func EditarProfile(_ sender: Any) {
        if(Editar.title == "Editar"){
            self.tfPeso.isEnabled = true
            self.tfAltura.isEnabled = true
            self.tfSexo.isEnabled = true
            self.tfNombre.isEnabled = true
            self.btEditarFoto.isEnabled = true
            Editar.title = "Guardar"
        }else if(Editar.title == "Guardar"){
            if var altura:Double = Double(tfAltura.text!){
                altura *= altura
                let peso:Double = Double(tfPeso.text!)!
                var BMI:Double = peso/altura
                BMI = Double(round(1000*BMI)/1000)
                tfBmi.text = "\(BMI)"
            }
            self.tfPeso.isEnabled = false
            self.tfAltura.isEnabled = false
            self.tfSexo.isEnabled = false
            self.tfNombre.isEnabled = false
            self.btEditarFoto.isEnabled = false
            Editar.title = "Editar"
        }
        
    }
    
    func dataFilePath() -> String {
        let url = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let pathArchivo = url.appendingPathComponent("ProfileInfo.plist")
        return pathArchivo.path
        
    }
    @IBAction func applicacionBackground(notification: NSNotification){
        let arreglo:NSMutableArray = []
        arreglo.add(tfBmi.text!)
        arreglo.add(tfPeso.text!)
        arreglo.add(tfAltura.text!)
        arreglo.add(tfSexo.text!)
        arreglo.add(tfNombre.text!)
        arreglo.write(toFile: dataFilePath(), atomically: true)
    }
    @IBAction func imgPicker(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            picker.delegate = self
            picker.sourceType = .photoLibrary
            present(picker, animated: true, completion: nil)
        }
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

        imgFoto.image = tempImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
