//
//  HeaderAndBannerCell.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 27/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class Header: CategoryCell {
    
    let cellID = "BannerCell"
    
    override func setupViews() {
      
        backgroundColor = UIColor.black
        
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        
        detailCollectionView.register(BannerCell.self, forCellWithReuseIdentifier: cellid)
        
        addSubview(detailCollectionView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView]))
        
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 14)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = foodCategoty?.food?.count {
            return count
        }
        return 0
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =   collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! DetailTableviewCell
        cell.foodCell = foodCategoty?.food?[indexPath.row]
        return cell
    }
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width, height: frame.height)
    }
    
}

class BannerCell: DetailTableviewCell {
    
    override func setup() {
        imageViewDetail.translatesAutoresizingMaskIntoConstraints = false
         imageViewDetail.layer.cornerRadius  = 0
        addSubview(imageViewDetail)
        
        imageViewDetail.addSubview(titlelabelDetail)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageViewDetail]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": imageViewDetail]))
    
    }
    
    
}
