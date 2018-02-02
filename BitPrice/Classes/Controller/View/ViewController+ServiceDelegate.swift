//
//  ViewController+ServiceDelegate.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 02/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import NotificationBannerSwift
import UIKit

extension ViewController: TickerServiceDelegate {
    
    func tickerGetDidComplete(ticker: Ticker, date: Date, fromCache: Bool) {
        bodyView.priceView.setPrice(ticker.USD.last, date: date)
        bodyView.priceView.spinnerView.hide()
        
        if fromCache {
            StatusBarNotificationBanner.noConnection.show()
        }
    }
    
    func tickerGetDidComplete(failure: ServiceFailureType) {
        bodyView.priceView.spinnerView.hide()
    }
    
}

extension ViewController: MarketPriceServiceDelegate {
    
    func marketPriceGetDidComplete(marketPrice: MarketPrice) {
        let ref = UserDefaults.standard.reference()
        
        let firsPrice = marketPrice.values.first?.y ?? 0
        let lastPrice = marketPrice.values.last?.y ?? 0
        var values = [ChartDataEntry]()
        
        for value in marketPrice.values {
            let x = Double(value.x)
            let y = Double(value.y)
            values.append(ChartDataEntry(x: x, y: y))
        }
        
        bodyView.historyView.setPrices(firstPrice: firsPrice, lastPrice: lastPrice)
        bodyView.historyView.setChartData(reference: ref, values: values)
        bodyView.historyView.spinnerView.hide()
    }
    
    func marketPriceGetDidComplete(error: Error?) {
        bodyView.historyView.spinnerView.hide()
    }
    
}
