//
//  MarketPriceService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 01/02/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class MarketPriceService: Service<MarketPrice> {
    
    // MARK: - Variable
    
    private let apiService = MarketPriceApiService()
    
    weak var delegate: MarketPriceServiceDelegate?
    
    // MARK: - Public
    
    func get(reference: ReferenceType, cachedDays days: Int = 0) {
        if let marketPrice = dbFetch(reference: reference, cachedDays: days) {
            delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
            return
        }
        
        apiService.get(reference: reference, success: { (data) in
            self.success(reference: reference, data: data)
        }) { error in
            self.failure(reference: reference, error: error)
        }
    }
    
    // MARK: - Private
    
    private func success(reference: ReferenceType, data: Data) {
        if let marketPrice = jsonDecode(data: data) {
            delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
            dbInsert(reference: reference, data: data)
        } else {
            delegate?.marketPriceGetDidComplete(error: nil)
        }
    }
    
    private func failure(reference: ReferenceType, error: Error?) {
        if let marketPrice = self.dbFetch(reference: reference) {
            delegate?.marketPriceGetDidComplete(marketPrice: marketPrice)
        } else {
            delegate?.marketPriceGetDidComplete(error: error)
        }
    }
    
}

protocol MarketPriceServiceDelegate: class {
    func marketPriceGetDidComplete(marketPrice: MarketPrice)
    func marketPriceGetDidComplete(error: Error?)
}
