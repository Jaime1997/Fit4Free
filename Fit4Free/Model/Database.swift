//
//  Database.swift
//  Fit4Free
//
//  Created by Jaime Garza on 11/4/19.
//  Copyright © 2019 Jaime Garza. All rights reserved.
//

import Foundation
import RealmSwift

class Exercise: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var bodyPart = ""
    @objc dynamic var difficulty = ""
    @objc dynamic var videoUrl = ""
    @objc dynamic var time = 0
}
