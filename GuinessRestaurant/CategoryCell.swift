//
//  CategoryCell.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 12/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
        
     ///   detailCollectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
    //   detailCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
         //    detailCollectionView.widthAnchor.constraint(equalToConstant: 100)
        //  detailCollectionView.heightAnchor.constraint(equalTo: frame.height).isActive = true
        
        detailCollectionView.register(DetailTableviewCell.self, forCellWithReuseIdentifier: cellid)
     
     addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-14-[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[nameLabel(30)][v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": detailCollectionView, "nameLabel": nameLabel]))
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       return collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! DetailTableviewCell
    
      
    }
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 180, height:frame.height - 30)
                }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
}

class DetailTableviewCell: UICollectionViewCell {
    
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
        labelD.font = UIFont.systemFont(ofSize: 13)
        return labelD
    }()
    let pricelabelDetail: UILabel = {
        let labelD = UILabel()
        labelD.text = "GBP 13.50"
        labelD.font = UIFont.systemFont(ofSize: 10)
        labelD.textColor = UIColor.darkGray
        return labelD
    }()
}


