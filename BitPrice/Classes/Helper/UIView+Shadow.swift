//
//  UIView+Shadow.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 3
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.125
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 0.5
    }
    
}
