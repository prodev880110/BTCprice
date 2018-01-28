//
//  Date+Calc.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 28/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK: Publics
    
    func days(from: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: from, to: self).day ?? 0
    }
    
    func minus(days: Int) -> Date {
        return self.addComponentsToDate(days: -days)
    }
    
    // MARK: Privates
    
    private func addComponentsToDate(days: Int) -> Date {
        var dateComponents = DateComponents()
        dateComponents.day = days
        return Calendar.current.date(byAdding: dateComponents, to: self)!
    }
    
}
