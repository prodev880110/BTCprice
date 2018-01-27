//
//  MarketPriceApiService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class MarketPriceApiService: ApiService {
    
    // MARK: - Variable
    
    weak var delegate: MarketPriceApiServiceDelegate?
    
    // MARK: - Public
    
    func get(referenceType: ReferenceType) {
        let params = parameters(referenceType: referenceType)
        _ = self.sessionManager.request(MarketPriceApiRouter.get(params))
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    self.delegate?.marketPriceApiGetDidComplete(error: nil)
                    return
                }
                
                if let error = response.error {
                    self.delegate?.marketPriceApiGetDidComplete(error: error)
                    return
                }
                
                do {
                    let marketPrice = try JSONDecoder().decode(MarketPrice.self, from: data)
                    self.delegate?.marketPriceApiGetDidComplete(marketPrice: marketPrice)
                } catch let error {
                    self.delegate?.marketPriceApiGetDidComplete(error: error)
                }
        }
    }
    
    // MARK: - Private
    
    private func parameters(referenceType: ReferenceType) -> [String: String] {
        let timespan: String?
        let start: String?
        
        switch referenceType {
        case .day:
            timespan = "1days"
            start = "2018-01-27"
        case .month:
            timespan = "1months"
            start = "2018-01-01"
        case .year:
            timespan = "1years"
            start = "2018-01-01"
        case .all:
            timespan = nil
            start = nil
        }
        
        var params: [String: String] = [:]
        params["format"] = "json"
        
        if let timespan = timespan {
            params["timespan"] = timespan
        }
        
        if let start = start {
            params["start"] = start
        }
        
        return params
    }
    
}

protocol MarketPriceApiServiceDelegate: class {
    func marketPriceApiGetDidComplete(marketPrice: MarketPrice)
    func marketPriceApiGetDidComplete(error: Error?)
}
