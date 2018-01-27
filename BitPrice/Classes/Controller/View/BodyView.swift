//
//  BodyView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit

class BodyView: CardView {
    
    // MARK: - Outlet
    
    @IBOutlet private weak var topView: BodyPriceView!
    @IBOutlet weak var historyView: BodyHistoryView!
    
    // MARK: - Public
    
    func setup(reference: ReferenceType, referencePrice: Float, currentPrice: Float) {
        topView.setPrices(referencePrice: referencePrice, currentPrice: currentPrice)
        topView.setUpdated(date: Date())
        
        historyView.setPrices(referencePrice: referencePrice, currentPrice: currentPrice)
        setReference(reference)
    }
    
    func setReference(_ reference: ReferenceType) {
        historyView.setReference(reference)
    }
    
}
