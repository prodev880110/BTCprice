//
//  Date+Components.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Date {
    
    var startOfWeek: Date {
        let calendar = Calendar(identifier: .gregorian)
        return calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
    }
    
    var startOfYear: Date {
        let calendar = Calendar.current
        return calendar.date(from: calendar.dateComponents([.year], from: self))!
    }
    
    var startOfBitcoin: Date {
        return Date.fromString("2009-01-03", dateFormat: "yyyy-MM-dd")
    }

}
