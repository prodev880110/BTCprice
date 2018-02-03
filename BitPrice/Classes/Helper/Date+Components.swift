//
//  Date+Components.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Date {

    var startOfBitcoin: Date {
        return Date.fromString("2009-01-03", dateFormat: "yyyy-MM-dd")
    }

}
