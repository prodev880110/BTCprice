//
//  UserDefaults+App.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults {

    private struct Key {
        static let referenceType = "reference"
    }

    // MARK: - Reference

    func reference() -> ReferenceType {
        let storedValue = value(forKey: Key.referenceType)
        var type: ReferenceType?

        if let storedValue = storedValue {
            let value = storedValue as? String ?? ReferenceType.week.rawValue
            type = ReferenceType(rawValue: value)
        }

        return type ?? ReferenceType.week
    }

    func setReference(_ type: ReferenceType) {
        set(type.rawValue, forKey: Key.referenceType)
    }

}
