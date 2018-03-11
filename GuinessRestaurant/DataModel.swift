//
//  DataModel.swift
//  GuinessRestaurant
//
//  Created by Dan  Tatar on 10/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class Food {
    
     
    var name: String
    var course: Course
    var price: Double
    var imageFood: UIImage
    
    init(name: String,course: Course,  price: Double, imageFood: UIImage) {
        self.name = name
        self.price = price
        self.imageFood = imageFood
        self.course = course
    }
  
}

enum Course: String {
    case mainCourse = "Main course"
    case desert = "Desert"
    case Drinks = "Drinks"
}






