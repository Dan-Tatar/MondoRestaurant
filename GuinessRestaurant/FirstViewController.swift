//
//  FirstViewController.swift
//  GuinessRestaurant
//
//  Created by Dan  Tatar on 10/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  var collectionView: UICollectionView!
    
     var menu: [FoodCategory] = []
    
override func viewDidLoad() {
  //    collectionView?.backgroundColor = UIColor.white
     //  collectionView.title
    menu  = FoodCategory.detailMenu()
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
     layout.sectionInset = UIEdgeInsets(top: 50, left: 10, bottom: 10, right: 10)
   // layout.itemSize = CGSize(width: 90, height: 120)
    
    collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = UIColor.white
    collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: "Cell")
//collectionView.backgroundColor = UIColor.whiteColor()
    view.addSubview(collectionView)
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CategoryCell
      cell.foodCategoty = menu[indexPath.item]
       cell.backgroundColor = UIColor.clear
    
        return cell
    }
    //Updating the cells for tye entire width
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
}


    

