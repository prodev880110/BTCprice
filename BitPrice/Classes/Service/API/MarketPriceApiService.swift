//
//  MarketPriceApiService.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 27/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import Foundation

class MarketPriceApiService: ApiService {
    
    // MARK: - Public
    
    func get(reference: ReferenceType,
             success: @escaping (Data) -> Void,
             failure: @escaping (ServiceFailureType) -> Void) {
        
        let params = parameters(reference: reference)
        
        _ = self.sessionManager.request(MarketPriceApiRouter.get(params))
            .validate(statusCode: [200])
            .responseJSON { response in
                guard let data = response.data else {
                    failure(self.failure())
                    return
                }
                
                if response.error != nil {
                    failure(self.failure())
                    return
                }
                
                success(data)
        }
    }
    
    // MARK: - Private
    
    private func parameters(reference: ReferenceType) -> [String: String] {
        let start: Date
        let timespan: String
        
        switch reference {
        case .week:
            start = Date().startOfWeek
            timespan = "1weeks"
        case .month:
            start = Date().startOfMonth
            timespan = "1months"
        case .year:
            start = Date().startOfYear
            timespan = "1years"
        case .all:
            start = Date().startOfBitcoin
            timespan = "\(Date().years(from: start))years"
        }
        
        var params: [String: String] = [:]
        params["start"] = start.toString(dateFormat: "yyyy-MM-dd")
        params["timespan"] = timespan
        params["format"] = "json"
        
        return params
    }
    
}
