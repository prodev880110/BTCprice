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
        
    private let tickerService = TickerService()
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
        tickerService.get()
        marketPriceService.get(reference: reference)
        
        if let priceView = bodyView.priceView {
            priceView.spinnerView.show(onView: priceView)
        }
        
        if let historyView = bodyView.historyView {
            historyView.spinnerView.show(onView: historyView)
        }
    }
    
    // MARK: - Private
    
    private func setupVariables() {
        tickerService.delegate = self
        marketPriceService.delegate = self
    }
    
    private func setupViews(reference: ReferenceType) {
        headerView.delegate = self
        footerView.delegate = self
        footerView.setReference(reference)
    }

}

