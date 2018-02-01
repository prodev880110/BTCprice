//
//  ViewController+TickerServiceDelegate.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import UIKit

extension ViewController: TickerApiServiceDelegate {
    
    func tickerApiGetDidComplete(ticker: Ticker) {
        bodyView.priceView.setPrice(ticker.USD.last)
        spinnerView.hide()
    }
    
    func tickerApiGetDidComplete(error: Error?) {
        spinnerView.hide()
    }
    
}
