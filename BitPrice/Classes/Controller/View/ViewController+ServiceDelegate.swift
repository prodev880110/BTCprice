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
        bodyView.priceView.setPrice(0)
        bodyView.priceView.spinnerView.hide()

        switch failure {
        case .server:
            StatusBarNotificationBanner.serverFailure.show()
        case .connection:
            StatusBarNotificationBanner.noConnection.show()
        }
    }

}

extension ViewController: MarketPriceServiceDelegate {

    func marketPriceGetDidComplete(marketPrice: MarketPrice) {
        let ref = UserDefaults.standard.reference()

        let firsPrice = marketPrice.values.first?.yAxis ?? 0
        let lastPrice = marketPrice.values.last?.yAxis ?? 0
        var values = [ChartDataEntry]()

        for value in marketPrice.values {
            let x = Double(value.xAxis)
            let y = Double(value.yAxis)
            values.append(ChartDataEntry(x: x, y: y))
        }

        bodyView.historyView.setLoaded(true)
        bodyView.historyView.setPrices(firstPrice: firsPrice, lastPrice: lastPrice)
        bodyView.historyView.setChartData(reference: ref, values: values)
        bodyView.historyView.spinnerView.hide()
    }

    func marketPriceGetDidComplete(failure: ServiceFailureType) {
        bodyView.historyView.setLoaded(true)
        bodyView.historyView.spinnerView.hide()
    }

}
