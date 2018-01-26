//
//  PriceView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class PriceView: CardView {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var updatedLabel: UILabel!
    @IBOutlet private weak var referenceLabel: UILabel!
    @IBOutlet private weak var indicatorImageView: UIImageView!
    @IBOutlet private weak var percentLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var diffLabel: UILabel!
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.text = "price_view.price".localized
        self.updatedLabel.text = nil
        self.referenceLabel.text = nil
        self.percentLabel.text = nil
        self.priceLabel.text = nil
        self.diffLabel.text = nil
    }
    
    // MARK: - Public
    
    func setUpdated(date: Date) {
        let dateFormat = "price_view.date_format".localized
        self.updatedLabel.text = date.toString(dateFormat: dateFormat)
    }
    
    func setReference(type: PriceReferenceType) {
        self.referenceLabel.text = type.rawValue.localized
    }
    
    func setPrices(referencePrice: Float, currentPrice: Float) {
        let diff = (currentPrice - referencePrice)
        let color: UIColor
        let imageName: String?
        
        if diff == 0 {
            color = UIColor.app.darkGray
            imageName = nil
        } else if diff > 0 {
            color = UIColor.app.green
            imageName = "ic_arrow_drop_up"
        } else {
            color = UIColor.app.red
            imageName = "ic_arrow_drop_down"
        }
        
        setIndicatorImage(imageName: imageName)
        setPercent(referencePrice: referencePrice, currentPrice: currentPrice, color: color)
        setPrice(currentPrice)
        setDiff(diff, color: color)
    }
    
    // MARK: - Private
    
    private func setIndicatorImage(imageName: String?) {
        if let imageName = imageName {
            self.indicatorImageView.image = UIImage(named: imageName)
        }
    }
    
    private func setPercent(referencePrice: Float, currentPrice: Float, color: UIColor) {
        let percent = (1 - (currentPrice / referencePrice))
        self.percentLabel.text = percent.toPercentString()
        self.percentLabel.textColor = color
    }
    
    private func setPrice(_ price: Float) {
        self.priceLabel.text = price.toCurrencyString()
    }
    
    private func setDiff(_ diff: Float, color: UIColor) {
        self.diffLabel.text = diff.toCurrencyString()
        self.diffLabel.textColor = color
    }

}
