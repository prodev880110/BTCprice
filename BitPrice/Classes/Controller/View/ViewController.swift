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
    private let marketPriceService = MarketPriceService()
    
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
        
        tickerService.get(success: { (url, ticker) in
            self.tickerServiceGetSuccess(ticker: ticker)
        }) { (url, error) in
            self.spinnerView.hide()
        }
        
        marketPriceService.get(reference: reference)
    }
    
    // MARK: - Private
    
    private func setupVariables() {
        marketPriceService.delegate = self
    }
    
    private func setupViews(reference: ReferenceType) {
        headerView.delegate = self
        footerView.delegate = self
        footerView.setReference(reference)
    }
    
    private func tickerServiceGetSuccess(ticker: Ticker) {
        bodyView.priceView.setPrice(ticker.USD.last)
        spinnerView.hide()
    }

}

