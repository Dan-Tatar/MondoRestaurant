//
//  SecondViewController.swift
//  GuinessRestaurant
//
//  Created by Dan  Tatar on 10/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
   var menu: [Food] = []
  
    @IBOutlet weak var tableView: UITableView!
    
   
    override func viewDidLoad() {
        detailMenu()
        navigationItem.title = " Menu"
      
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as? MenuCell
        let cellMenu = menu[indexPath.row]
        cell?.nameFood.text = cellMenu.name
        cell?.courseFood.text = cellMenu.course.rawValue
        cell?.priceFood.text = "£ " + String(cellMenu.price)
        cell?.imageFood.image = cellMenu.imageFood
        cell?.imageFood.layer.cornerRadius = 10
        cell?.imageFood.layer.masksToBounds = true
        return cell!
    }
    func detailMenu() {
        var steak  = Food(name: "Steak", course: Course.mainCourse, price: 15.50, imageFood: #imageLiteral(resourceName: "steak1"))
        var salmon = Food(name: "Salmon", course: Course.mainCourse, price: 12.00, imageFood: #imageLiteral(resourceName: "salmon1"))
        var cheesecake  = Food(name: "Cheesecake", course: Course.desert, price: 7.00, imageFood: #imageLiteral(resourceName: "cheesecake1"))
        var icecream  = Food(name: "Icecream", course: Course.mainCourse, price: 7.00, imageFood: #imageLiteral(resourceName: "Icecream1"))
        var wine  = Food(name: "Wine", course: Course.Drinks, price: 5.50, imageFood: #imageLiteral(resourceName: "wine1"))
        var fresh  = Food(name: "Fresh", course: Course.Drinks, price: 5.00, imageFood: #imageLiteral(resourceName: "orange-fresh"))
        
        menu.append(steak)
        menu.append(salmon)
        menu.append(cheesecake)
        menu.append(icecream)
        menu.append(wine)
        menu.append(fresh)
    }
}

