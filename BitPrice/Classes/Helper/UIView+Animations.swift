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

    func shimmerAnimation() {

        // gradient

        let lighColor = UIColor(white: 0, alpha: 0.2).cgColor
        let darkColor = UIColor.black.cgColor

        let width = bounds.size.width
        let height = bounds.size.height
        let frame = CGRect(x: -width, y: 0, width: 3*width, height: height)

        let gradient = CAGradientLayer()
        gradient.colors = [darkColor, lighColor, darkColor]
        gradient.frame = frame
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.525)
        gradient.locations = [0.4, 0.5, 0.6]

        layer.mask = gradient

        // animation

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0.0, 0.1, 0.2]
        animation.toValue = [0.8, 0.9, 1.0]
        animation.duration = 2
        animation.repeatCount = 1

        gradient.add(animation, forKey: "shimmer")

        // remove animation

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            gradient.removeFromSuperlayer()
        }
    }

}
