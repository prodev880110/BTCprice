//
//  String+Localized.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
