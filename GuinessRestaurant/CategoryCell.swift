//
//  CategoryCell.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 12/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   
    var foodCategoty: FoodCategory? {
        didSet {
            if let name = foodCategoty?.name {
            nameLabel.text = name.rawValue
                nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
            }
        detailCollectionView.reloadData()
        }
    }


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    let cellid = "DetailCell"
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var detailCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
     //   layout.scrollDirection = .horizontal
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.backgroundColor = UIColor.clear
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            return collectionView
    }()
    let nameLabel: UILabel = {
        var name = UILabel()
        name.text = "Food"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    func setupViews() {
        backgroundColor = UIColor.black
        addSubview(detailCollectionView)
        addSubview(nameLabel)
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        detailCollectionView.register(DetailTableviewCell.self, forCellWithReuseIdentifier: cellid)
     
     addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView, "nameLabel": nameLabel]))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = foodCategoty?.food?.count {
        return count
        }
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      let cell =   collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! DetailTableviewCell
      cell.foodCell = foodCategoty?.food?[indexPath.row]
      return cell
    }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
      return CGSize(width: 180, height:frame.height - 30)
                }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}



