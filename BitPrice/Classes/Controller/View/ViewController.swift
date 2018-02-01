//
//  ViewController.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!
    @IBOutlet private weak var footerView: FooterView!
    
    // MARK: - Variable
    
    var spinnerView = SpinnerView()
    
    private let tickerService = TickerApiService()
    private let marketPriceService = MarketPriceApiService()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = UserDefaults.standard.reference()
        
        setupVariables()
        setupViews(reference: ref)
        callServices(reference: ref)
    }
    
    // MARK: - Public
    
    func callServices(reference: ReferenceType) {
        spinnerView.show(onView: bodyView, hideAfter: 2)
        tickerService.get()
        
        marketPriceService.get(reference: reference, success: { (url, marketPrice) in
            self.marketPriceServiceGetSuccess(marketPrice: marketPrice)
        }) { (url, error) in
            self.spinnerView.hide()
        }
    }
    
    // MARK: - Private
    
    private func setupVariables() {
        tickerService.delegate = self
    }
    
    private func setupViews(reference: ReferenceType) {
        headerView.delegate = self
        footerView.delegate = self
        footerView.setReference(reference)
    }
    
    private func marketPriceServiceGetSuccess(marketPrice: MarketPrice) {
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
        spinnerView.hide()
    }

}

