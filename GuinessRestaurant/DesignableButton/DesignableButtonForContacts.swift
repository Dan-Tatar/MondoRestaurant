//
//  DesignableButton.swift
//  MondoRestaurant
//
//  Created by Dan  Tatar on 07/04/2018.
//  Copyright © 2018 Dany. All rights reserved.
//

import Foundation

import UIKit

@IBDesignable class DesignableButton: UIButton {
    
 
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            
        }
    }
}
