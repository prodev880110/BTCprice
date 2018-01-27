//
//  NSObject+ClassName.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Qoode. All rights reserved.
//

import Foundation

extension NSObject {
    
    class var className: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    var className: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
    
}
