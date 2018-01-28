//
//  BodyPriceView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class BodyPriceView: UIView {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var updatedLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "body_price_view.title".localized
        self.updatedLabel.text = nil
        self.priceLabel.text = nil
    }
    
    // MARK: - Public
    
    func setPrice(_ price: Float) {
        self.priceLabel.text = price.toCurrencyString()
        setUpdated(date: Date())
    }
    
    // MARK: - Private

    private func setUpdated(date: Date) {
        let dateFormat = "body_price_view.date_format".localized
        self.updatedLabel.text = date.toString(dateFormat: dateFormat)
    }
    
}
