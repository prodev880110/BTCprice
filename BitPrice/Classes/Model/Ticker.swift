//
//  Ticker.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

struct Ticker: Decodable {
    
    let USD: TickerItem
    let BRL: TickerItem
    
    struct TickerItem: Decodable {
        let last: Float
    }
    
}
