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
  
    var menu: [FoodCategory] = []
  
  
    @IBOutlet weak var tableView: UITableView!
    
   
    override func viewDidLoad() {
         super.viewDidLoad()
         menu = FoodCategory.detailMenu()
        
        setTitle()

    }
    
    func setTitle() {
        let navTitle = UILabel()
        navTitle.text  =  "Menu"
        navTitle.textAlignment = .center
        navTitle.font = UIFont.boldSystemFont(ofSize: 26)
        
        navigationItem.titleView = navTitle
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (menu[section].food?.count)!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return menu.count
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
  
        let label = UILabel()
        let menuSection = FoodCategory()
        label.frame = CGRect(x: 15, y: 0, width: view.frame.width, height: 30)
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text = menuSection.course[section]
        label.backgroundColor = UIColor.white
       headerView.addSubview(label)
       
         return headerView
        view.addSubview(label)
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let menu = FoodCategory()
        return menu.name?.rawValue
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as? MenuCell
        let cellMenu = menu[indexPath.section].food![indexPath.row]
        cell?.selectionStyle = .none
        cell?.nameFood.text = cellMenu.name
        cell?.priceFood.text = "£ " + String(cellMenu.price)
        cell?.imageFood.image = cellMenu.imageFood
        cell?.courseFood.text = cellMenu.course
        cell?.imageFood.layer.cornerRadius = 10
        cell?.imageFood.layer.masksToBounds = true
        return cell!
    }

}

