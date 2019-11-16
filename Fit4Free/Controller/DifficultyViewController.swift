//
//  DifficultyViewController.swift
//  Fit4Free
//
//  Created by Jaime Garza on 10/14/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import UIKit
import Foundation

class DifficultyViewController: UIViewController {
    
    var bodyPart : String = ""
    var difficulty = ["beginner", "intermediate", "advanced"]
    var buttonPressed : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func beginnerButtonPressed(_ sender: Any) {
        
        buttonPressed = 0
        performSegue(withIdentifier: "goToExcerciseSelection", sender: self)
        
    }
    
    
    @IBAction func intermediateButtonPressed(_ sender: Any) {
        
        buttonPressed = 1
        performSegue(withIdentifier: "goToExcerciseSelection", sender: self)
        
    }
    
    
    @IBAction func advancedButtonPressed(_ sender: Any) {
        
        buttonPressed = 2
        performSegue(withIdentifier: "goToExcerciseSelection", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Create a new variable to store the instance of PlayerTableViewController
        let destinationVC = segue.destination as! ExcerciseSelectionViewController
        destinationVC.bodyPart = bodyPart
        destinationVC.difficulty = difficulty[buttonPressed]
    }
    
}
