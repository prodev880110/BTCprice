//
//  MarketPrice.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

struct MarketPrice: Decodable {

    let values: [Value]

}

struct Value: Decodable {
    let xAxis: Int
    let yAxis: Float

    enum CodingKeys: String, CodingKey {
        case xAxis = "x"
        case yAxis = "y"
    }

}
