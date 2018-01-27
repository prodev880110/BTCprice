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
    @IBOutlet private weak var diffLabel: UILabel!
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "price_view.title".localized
        self.updatedLabel.text = nil
        self.priceLabel.text = nil
        self.diffLabel.text = nil
    }
    
    // MARK: - Public
    
    func setUpdated(date: Date) {
        let dateFormat = "price_view.date_format".localized
        self.updatedLabel.text = date.toString(dateFormat: dateFormat)
    }
    
    func setPrices(referencePrice: Float, currentPrice: Float) {
        let diff = (currentPrice - referencePrice)
        let color: UIColor
        
        if diff == 0 {
            color = UIColor.app.darkGray
        } else if diff > 0 {
            color = UIColor.app.green
        } else {
            color = UIColor.app.red
        }
        
        setPrice(currentPrice)
        setDiff(diff, color: color)
    }
    
    // MARK: - Private
    
    private func setPrice(_ price: Float) {
        self.priceLabel.text = price.toCurrencyString()
    }
    
    private func setDiff(_ diff: Float, color: UIColor) {
        self.diffLabel.text = diff.toCurrencyString()
        self.diffLabel.textColor = color
    }

}
