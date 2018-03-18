//
//  DataModel.swift
//  GuinessRestaurant
//
//  Created by Dan  Tatar on 10/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class FoodCategory {
    var name: Course?
    var food:  [Food]?
    var sections: [String] = ["Main course", "Deserts", "Drinks"]
//    init(name: Course) {
   //     self.name = name
 //   }
    
    static func detailMenu() ->  [FoodCategory] {
       
        let mainCategoty = FoodCategory()
        mainCategoty.name =  Course.MainCourse
        var bestMain  = [Food]()
        
        var steak  =  Food(name: "Steak", price: 15.50, imageFood: #imageLiteral(resourceName: "steak1"))
        var salmon = Food(name: "Salmon", price: 12.00, imageFood: #imageLiteral(resourceName: "salmon1"))
        var carbonara = Food(name: "Carbonara", price: 10.00, imageFood: #imageLiteral(resourceName: "carbonara"))
        var squid = Food(name: "Squid with tagliatelle", price: 16.00, imageFood: #imageLiteral(resourceName: "squid with tagliatelle"))
        var tacos = Food(name: "Tacos", price: 11.50, imageFood: #imageLiteral(resourceName: "salmon1"))
        
        bestMain.append(salmon)
        bestMain.append(steak)
        bestMain.append(carbonara)
        bestMain.append(squid)
        bestMain.append(tacos)
     
        mainCategoty.food = bestMain
 
         let drinksCategory = FoodCategory()
        drinksCategory.name = Course.Drinks
      
        var bestDrinks = [Food]()
        var wine = Food(name: "Wine", price: 5.50, imageFood: #imageLiteral(resourceName: "wine1"))
        var fresh = Food(name: "Fresh", price: 5.00, imageFood: #imageLiteral(resourceName: "orange-fresh"))
        var cosmopolitan = Food(name: "Cosmopolitan", price: 7.00, imageFood: #imageLiteral(resourceName: "cosmopolitan"))
        var water = Food(name: "Water", price: 2.00, imageFood: #imageLiteral(resourceName: "water"))
        var bloodyMary = Food(name: "Bloody Mary", price: 6.00, imageFood: #imageLiteral(resourceName: "bloody mary"))
        var beer = Food(name: "Beer", price: 4.50, imageFood: #imageLiteral(resourceName: "beer"))
        
        bestDrinks.append(wine)
        bestDrinks.append(fresh)
        bestDrinks.append(cosmopolitan)
        bestDrinks.append(water)
        bestDrinks.append(bloodyMary)
        bestDrinks.append(beer)
       
        drinksCategory.food = bestDrinks
        
        
        let desertCategory = FoodCategory()
        desertCategory.name = Course.Desert
        var bestDesert = [Food]()
    
        var cheesecake = Food(name: "Cheesecake", price: 7.00, imageFood: #imageLiteral(resourceName: "cheesecake1"))
        var icecream = Food(name: "Icecream", price: 7.00, imageFood: #imageLiteral(resourceName: "Icecream1"))
        var tiramisu = Food(name: "Tiramisu", price: 5.00, imageFood: #imageLiteral(resourceName: "tiramisu"))
        bestDesert.append(cheesecake)
        bestDesert.append(icecream)
         bestDesert.append(tiramisu)
       desertCategory.food = bestDesert
        
        return [mainCategoty, desertCategory, drinksCategory]
    }
    
}

class Food {
    var name: String
    var price: Double
    var imageFood: UIImage
    
    init(name: String,  price: Double, imageFood: UIImage) {
        self.name = name
        self.price = price
        self.imageFood = imageFood
    }
}

enum Course: String {
    case MainCourse = "Main course"
    case Desert = "Desert"
    case Drinks = "Drinks"
}






