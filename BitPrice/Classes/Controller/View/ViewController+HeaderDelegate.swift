//
//  ViewController+HeaderDelegate.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

extension ViewController: HeaderViewDelegate {
    
    func headerViewRefreshDidSelect() {
        let ref = UserDefaults.standard.reference()
        callTickerService()
        callMarketPriceService(reference: ref)
    }
    
}

