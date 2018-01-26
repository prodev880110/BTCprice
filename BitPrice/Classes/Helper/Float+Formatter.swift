//
//  Float+Formatter.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Float {
    
    func toPercentString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .percent
        formatter.usesGroupingSeparator = true
        formatter.maximumFractionDigits = 1
        
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "\(self)"
    }
    
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currencyAccounting
        formatter.usesGroupingSeparator = true
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: self)
        return formatter.string(from: number) ?? "\(self)"
    }
    
}
