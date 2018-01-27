//
//  MarketPrice.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

struct MarketPrice: Decodable {
    
    let period: String
    let unit: String
    let values: [Value]
    
    struct Value: Decodable {
        let x: Int
        let y: Float
    }
    
}
