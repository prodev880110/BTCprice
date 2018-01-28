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
        let date = calendar.date(from: calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self))!
        return isSameDate(date) ? Date().minus(days: 1).startOfWeek : date
    }
    
    var startOfMonth: Date {
        let calendar = Calendar.current
        let date = calendar.date(from: calendar.dateComponents([.year, .month], from: self))!
        return isSameDate(date) ? Date().minus(days: 1).startOfMonth : date
    }
    
    var startOfYear: Date {
        let calendar = Calendar.current
        let date = calendar.date(from: calendar.dateComponents([.year], from: self))!
        return isSameDate(date) ? Date().minus(days: 1).startOfYear : date
    }
    
    var startOfBitcoin: Date {
        return Date.fromString("2009-01-03", dateFormat: "yyyy-MM-dd")
    }
    
    // MARK: - Private
    
    private func isSameDate(_ date: Date) -> Bool {
        return Date().days(from: date) == 0
    }

}
