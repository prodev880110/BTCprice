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
            delegate?.marketPriceApiGetDidComplete(marketPrice: marketPrice)
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
        if let marketPrice = self.jsonDecode(data: data) {
            self.delegate?.marketPriceApiGetDidComplete(marketPrice: marketPrice)
            self.dbInsert(reference: reference, data: data)
        } else {
            self.delegate?.marketPriceApiGetDidComplete(error: nil)
        }
    }
    
    private func failure(reference: ReferenceType, error: Error?) {
        if let marketPrice = self.dbFetch(reference: reference) {
            self.delegate?.marketPriceApiGetDidComplete(marketPrice: marketPrice)
        } else {
            self.delegate?.marketPriceApiGetDidComplete(error: error)
        }
    }
    
}

protocol MarketPriceServiceDelegate: class {
    func marketPriceApiGetDidComplete(marketPrice: MarketPrice)
    func marketPriceApiGetDidComplete(error: Error?)
}
