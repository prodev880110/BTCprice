//
//  BodyHistoryView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Charts
import UIKit

class BodyHistoryView: UIView {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var referenceLabel: UILabel!
    @IBOutlet private weak var indicatorImageView: UIImageView!
    @IBOutlet private weak var percentLabel: UILabel!
    @IBOutlet private weak var chartView: ChartView!
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupChart()
        self.titleLabel.text = "price_history_view.price".localized
        self.referenceLabel.text = nil
        self.percentLabel.text = nil
    }
    
    // MARK: - Public
    
    func setReference(_ type: ReferenceType) {
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
    }
    
    // MARK: - Private
    
    private func setIndicatorImage(imageName: String?) {
        if let imageName = imageName {
            self.indicatorImageView.image = UIImage(named: imageName)
        }
    }
    
    private func setPercent(referencePrice: Float, currentPrice: Float, color: UIColor) {
        let percent = abs(1 - (currentPrice / referencePrice))
        self.percentLabel.text = percent.toPercentString()
        self.percentLabel.textColor = color
    }
    
    private func setupChart() {
        var values = [ChartDataEntry]()
        
        for i in 0 ..< 20 {
            let x = Double(i)
            let y = Double(arc4random_uniform(50))
            let value = ChartDataEntry(x: x, y: y)
            values.append(value)
        }
        
        chartView.setData(values: values)
    }
    
}

