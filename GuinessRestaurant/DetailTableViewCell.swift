//
//  DetailTableViewCell.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 28/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class DetailTableviewCell: UICollectionViewCell {
    
    var foodCell: Food? {
        didSet {
            if let title = foodCell?.name {
                titlelabelDetail.text = title
            }
            if let image = foodCell?.imageFood {
                imageViewDetail.image = image
            
            
            }
            if let price = foodCell?.price {
                pricelabelDetail.text = "£ " + String(price)
            }
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup() {
        
        addSubview(imageViewDetail)
        addSubview(titlelabelDetail)
        addSubview(pricelabelDetail)
        
        imageViewDetail.frame = CGRect(x: 0, y: 0, width: frame.width, height: 110)
        titlelabelDetail.frame = CGRect(x: 10, y:  110, width: frame.width, height: 20)
        pricelabelDetail.frame = CGRect(x: 10, y:  130, width: frame.width, height: 20)
        
    }
    
    let imageViewDetail: UIImageView = {
        let iv = UIImageView()
        
        iv.image = UIImage(named: "salmon1")
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    let titlelabelDetail: UILabel = {
        let labelD = UILabel()
        labelD.text = "Salmon"
        labelD.font = UIFont.systemFont(ofSize: 16)
        return labelD
    }()
    let pricelabelDetail: UILabel = {
        let labelD = UILabel()
        labelD.text = "GBP 13.50"
        labelD.font = UIFont.systemFont(ofSize: 14)
        labelD.textColor = UIColor.darkGray
        return labelD
    }()
}
