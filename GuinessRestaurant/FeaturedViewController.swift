//
//  FirstViewController.swift
//  GuinessRestaurant
//
//  Created by Dan  Tatar on 10/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//
import  Foundation
import UIKit

class FeaturedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

  var collectionView: UICollectionView!
    
    var menu: [FoodCategory] = []
    var headerImages: [FoodCategory] = []
    
    let mainCell = "Cell"
    let cellForItem1 = "CellIndexPath1"
    let headerCell = "HeaderCell"
    
override func viewDidLoad() {

  navigationController?.navigationBar.prefersLargeTitles = true
  navigationItem.title = "Mondo restaurant"
    
    menu  = FoodCategory.detailMenu()
    headerImages = FoodCategory.headerArray()
    
    settingLayout()
  
}
    func settingLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        // layout.itemSize = CGSize(width: 90, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.white
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: mainCell)
        collectionView.register(SmallCategoryCellL.self, forCellWithReuseIdentifier: cellForItem1)
        collectionView.register(Header.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerCell)
        
        view.addSubview(collectionView)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 1 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellForItem1, for: indexPath) as! SmallCategoryCellL
                cell.foodCategoty = menu[indexPath.item]
            cell.backgroundColor = UIColor.clear
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCell, for: indexPath) as! CategoryCell
      cell.foodCategoty = menu[indexPath.item]
       cell.backgroundColor = UIColor.clear
    
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
          return CGSize(width: view.frame.width, height: 200)
    }
   
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCell, for: indexPath) as! Header
         header.backgroundColor = UIColor.clear
         header.foodCategoty = headerImages.first
        //  header.foodCategoty = menu.first
        return header
    }
}



    

