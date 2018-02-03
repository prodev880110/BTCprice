//
//  Bundle+InfoPlist.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

extension Bundle {

    func apiBaseUrl() -> String {
        return object(forInfoDictionaryKey: "ApiBaseUrl") as? String ?? ""
    }

}
