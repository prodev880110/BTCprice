//
//  Date+Formatter.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Date {
    
    func toString(dateFormat: String) -> String {
        let formatter = DateFormatter()

        formatter.locale = Locale.current
        formatter.dateFormat = dateFormat

        return formatter.string(from: self)
    }
    
    
    
}
