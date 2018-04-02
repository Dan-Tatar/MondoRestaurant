//
//  SmallCategoryCell.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 27/03/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation
import UIKit

class SmallCategoryCellL: CategoryCell {
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 130, height:frame.height - 30)
    }
}
