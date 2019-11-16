//
//  ViewController.swift
//  Fit4Free
//
//  Created by Jaime Garza on 10/13/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import UIKit
import Foundation
import RealmSwift

class ExcerciseSelectionViewController: UITableViewController {
    
    var exercisesArray = [Exercise]()
    
    var bodyPart : String = ""
    var difficulty : String = ""
    var selectedRow = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Realm.AT_remoteRealm{ (remoteRealm, error) in
            if let realm = remoteRealm {
//                try! realm.write {
//                    let pushup = Exercise()
//                    pushup.name = "pushup"
//                    pushup.bodyPart = "upper_body"
//                    pushup.difficulty = "intermediate"
//                    pushup.videoUrl = "https://www.youtube.com/watch?v=IODxDxX7oi4"
//                    pushup.time = 217
//                    realm.add(pushup)
//                }
                let results = realm.objects(Exercise.self).filter("bodyPart = '\(self.bodyPart)' AND difficulty = '\(self.difficulty)'")
                self.saveArray(tempArray: Array(results))
                
            } else {
                print("Error opening remote realm: \(error?.localizedDescription)")
            }
        }
    
    }
    
    func saveArray(tempArray: [Exercise]){
        
        exercisesArray = tempArray
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return exercisesArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "excerciseCell", for: indexPath)
        let excercise = exercisesArray[indexPath.row]
        
        cell.textLabel?.text = excercise.name
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath.row
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! VideoViewController
        destinationVC.url = exercisesArray[selectedRow].videoUrl
    }
}

fileprivate struct Constants {
    fileprivate static let authServer = URL(string: "https://fit-4-free.us1a.cloud.realm.io")!
    fileprivate static let realmServer = URL(string: "realms://fit-4-free.us1a.cloud.realm.io/sharedData")!
    fileprivate static let syncCredentials = SyncCredentials.usernamePassword(username: "developerF4F", password: "developerF4F")
}

extension Realm {
    static func AT_remoteRealm(callback: @escaping (Realm?, Swift.Error?) -> Void) {
        SyncUser.logIn(with: Constants.syncCredentials, server: Constants.authServer) { (remoteUser, error) in
            if let user = remoteUser {
                Realm.Configuration.defaultConfiguration.syncConfiguration =  SyncConfiguration(user: user, realmURL: Constants.realmServer)
                Realm.asyncOpen(callback: callback)
            } else {
                callback(nil, error)
            }
        }
    }
}

