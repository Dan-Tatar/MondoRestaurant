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
    var course: [String] = ["Main course", "Deserts", "Drinks"]

    static func detailMenu() ->  [FoodCategory] {
       
        let mainCategoty = FoodCategory()
        mainCategoty.name =  Course.MainCourse
        var bestMain  = [Food]()
        
        var steak  =  Food(name: "Steak", price: 15.50, imageFood: #imageLiteral(resourceName: "steak1"), course: Course.MainCourse.rawValue)
        var salmon = Food(name: "Salmon", price: 12.00, imageFood: #imageLiteral(resourceName: "salmon1"), course: Course.MainCourse.rawValue)
        var carbonara = Food(name: "Carbonara", price: 10.00, imageFood: #imageLiteral(resourceName: "carbonara"), course: Course.MainCourse.rawValue)
        var squid = Food(name: "Squid", price: 16.00, imageFood: #imageLiteral(resourceName: "squid with tagliatelle"), course: Course.MainCourse.rawValue)
        var tacos = Food(name: "Tacos", price: 11.50, imageFood: #imageLiteral(resourceName: "tacos"), course: Course.MainCourse.rawValue)
        
        bestMain.append(salmon)
        bestMain.append(steak)
        bestMain.append(carbonara)
        bestMain.append(squid)
        bestMain.append(tacos)
     
        mainCategoty.food = bestMain
 
         let drinksCategory = FoodCategory()
        drinksCategory.name = Course.Drinks
      
        var bestDrinks = [Food]()
        var wine = Food(name: "Wine", price: 5.50, imageFood: #imageLiteral(resourceName: "wine1"), course: Course.Drinks.rawValue)
        var fresh = Food(name: "Fresh", price: 5.00, imageFood: #imageLiteral(resourceName: "orange-fresh"), course: Course.Drinks.rawValue)
        var cosmopolitan = Food(name: "Cosmopolitan", price: 7.00, imageFood: #imageLiteral(resourceName: "cosmopolitan"), course: Course.Drinks.rawValue)
        var water = Food(name: "Water", price: 2.00, imageFood: #imageLiteral(resourceName: "water"), course: Course.Drinks.rawValue)
        var bloodyMary = Food(name: "Bloody Mary", price: 6.00, imageFood: #imageLiteral(resourceName: "bloody mary"), course: Course.Drinks.rawValue)
        var beer = Food(name: "Beer", price: 4.50, imageFood: #imageLiteral(resourceName: "beer"), course: Course.Drinks.rawValue)
        
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
    
        var cheesecake = Food(name: "Cheesecake", price: 7.00, imageFood: #imageLiteral(resourceName: "cheesecake1"), course: Course.Desert.rawValue)
        var icecream = Food(name: "Icecream", price: 7.00, imageFood: #imageLiteral(resourceName: "Icecream1"), course: Course.Desert.rawValue)
        var tiramisu = Food(name: "Tiramisu", price: 5.00, imageFood: #imageLiteral(resourceName: "tiramisu"), course: Course.Desert.rawValue)
        var pancakes = Food(name: "Pancakes", price: 6.00, imageFood: #imageLiteral(resourceName: "pancakes"), course: Course.Desert.rawValue)
        var cake = Food(name: "Cake", price: 5.50, imageFood: #imageLiteral(resourceName: "chocolateCake"), course: Course.Desert.rawValue)
        
        bestDesert.append(cheesecake)
        bestDesert.append(icecream)
        bestDesert.append(tiramisu)
        bestDesert.append(pancakes)
        bestDesert.append(cake)
       desertCategory.food = bestDesert
        
        return [mainCategoty, desertCategory, drinksCategory]
        
    }
    static func headerArray() ->  [FoodCategory] {
        let headerCategoty = FoodCategory()
        headerCategoty.name =  Course.MainCourse
        var wineGlasses = Food(name: "windeGlasses", price: 0, imageFood: #imageLiteral(resourceName: "wineGlasses"), course: Course.Desert.rawValue)
        var table =  Food(name: "tableFood", price: 0, imageFood: #imageLiteral(resourceName: "table"), course: Course.Desert.rawValue)
        var waiter = Food(name: "waiter ", price: 0, imageFood: #imageLiteral(resourceName: "waiter"), course: Course.Desert.rawValue)
      
        var foodHeader = [Food]()
        foodHeader.append(wineGlasses)
        foodHeader.append(table)
        foodHeader.append(waiter)
        headerCategoty.food = foodHeader
        return [headerCategoty]
    }
}

class Food {
    var name: String
    var price: Double
    var imageFood: UIImage
    var course: String
    
    init(name: String,  price: Double, imageFood: UIImage, course: String) {
        self.name = name
        self.price = price
        self.imageFood = imageFood
        self.course = course
    }
}

enum Course: String {
    case MainCourse = "Main course"
    case Desert = "Desert"
    case Drinks = "Drinks"
}



