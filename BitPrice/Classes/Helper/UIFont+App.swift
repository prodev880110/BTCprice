//
//  UIFont+App.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

extension UIFont {

    class func lightAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.light, size: size)!
    }
    
    class func appFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.regular, size: size)!
    }
    
    class func mediumAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.medium, size: size)!
    }
    
    class func boldAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.bold, size: size)!
    }
    
    class func blackAppFont(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: AppFontNames.black, size: size)!
    }

    private struct AppFontNames {
        static let light = "DINPro-Light"
        static let regular = "DINPro-Regular"
        static let medium = "DINPro-Medium"
        static let bold = "DINPro-Bold"
        static let black = "DINPro-Black"
    }
    
}
