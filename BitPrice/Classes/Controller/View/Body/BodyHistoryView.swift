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
    
    // MARK: - Variables
    
    var spinnerView = SpinnerView()
    
    // MARK: - UIView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "body_history_view.price".localized
        self.referenceLabel.text = nil
        self.percentLabel.text = nil
    }
    
    // MARK: - Public
    
    func setPrices(firstPrice: Float, lastPrice: Float) {
        let diff = (lastPrice - firstPrice)
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
        setPercent(firstPrice: firstPrice, lastPrice: lastPrice, color: color)
    }
    
    func setChartData(reference: ReferenceType, values: [ChartDataEntry]) {
        self.referenceLabel.text = reference.rawValue.localized
        chartView.setData(values: values)
    }
    
    // MARK: - Private
    
    private func setIndicatorImage(imageName: String?) {
        if let imageName = imageName {
            self.indicatorImageView.image = UIImage(named: imageName)
        }
    }
    
    private func setPercent(firstPrice: Float, lastPrice: Float, color: UIColor) {
        let percent = abs(1 - (lastPrice / firstPrice))
        self.percentLabel.text = percent.toPercentString()
        self.percentLabel.textColor = color
    }
    
}

