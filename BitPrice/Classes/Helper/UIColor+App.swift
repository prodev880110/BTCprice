//
//  UIColor+App.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

extension UIColor {

    convenience init(red: Int, green: Int, blue: Int) {
        let divisor: CGFloat = 255.0
        self.init(red: CGFloat(red)/divisor, green: CGFloat(green)/divisor, blue: CGFloat(blue)/divisor, alpha: 1)
    }

    struct app {
        // black
        static let black = UIColor(red: 66, green: 66, blue: 66)

        // gray
        static let ultraLightGray = UIColor(red: 246, green: 246, blue: 246)
        static let lightGray = UIColor(red: 235, green: 235, blue: 235)
        static let gray = UIColor(red: 178, green: 178, blue: 178)
        static let darkGray = UIColor(red: 124, green: 124, blue: 124)

        // green
        static let green = UIColor(red: 0, green: 200, blue: 180)

        // purple
        static let purple = UIColor(red: 76, green: 66, blue: 138)
        static let darkPurple = UIColor(red: 62, green: 52, blue: 140)

        // red
        static let red = UIColor(red: 231, green: 51, blue: 54)

        // white
        static let white = UIColor(red: 255, green: 255, blue: 255)
    }

}
