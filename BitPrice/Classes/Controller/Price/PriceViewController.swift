//
//  PriceViewController.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 25/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class PriceViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet private weak var priceView: PriceView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Private
    
    private func setupViews() {
        setupPrice()
    }
    
    private func setupPrice() {
        priceView.setUpdated(date: Date())
        priceView.setReference(type: .year)
        priceView.setPrices(referencePrice: 15000, currentPrice: 15500)
    }

}

