//
//  UIView+Animations.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func heartAnimation() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        
        animation.fromValue = NSValue(cgSize: CGSize(width: 1, height: 1))
        animation.toValue = NSValue(cgSize: CGSize(width: 1.5, height: 1.5))
        animation.autoreverses = true
        animation.duration = 0.1
        animation.beginTime = 0
        
        layer.add(animation, forKey: nil)
    }
    
}
